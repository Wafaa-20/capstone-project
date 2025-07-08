import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taleq/core/service/agora.dart';
import 'package:taleq/features/space/domain/usecases/add_comment_use_case.dart';
import 'package:taleq/features/space/domain/usecases/get_space.dart';
import 'package:taleq/features/space/presentation/bloc/space_event.dart';
import 'package:taleq/features/space/presentation/bloc/space_state.dart';

class SpaceBloc extends Bloc<SpaceEvent, SpaceState> {
  final GetSpaceListsUseCase _getSpaceListsUseCase;
  final AddCommentUseCase _addCommentUseCase;
  final SupabaseClient supabase;
  final AgoraService agoraService;

  RealtimeChannel? _membersChannel;
  RealtimeChannel? _commentsChannel;

  SpaceBloc(
    this._getSpaceListsUseCase,
    this.supabase,
    this._addCommentUseCase,
    this.agoraService,
  ) : super(SpaceInitial()) {
    on<GetSpaceLists>(getSpaceLists);
    on<UpdateMembersEvent>(_onUpdateMembers);
    on<UpdateCommentsEvent>(_onUpdateComments);
    on<AddCommentEvent>(addComment);
    on<ToggleMicEvent>(_toggleMic);
    on<InitAgoraEvent>(_initAgora);
    on<LeaveSpaceEvent>(_leaveSpace);
  }
  Future<void> _leaveSpace(
    LeaveSpaceEvent event,
    Emitter<SpaceState> emit,
  ) async {
    try {
      await supabase
          .from('space_members')
          .delete()
          .eq('user_id', event.userID)
          .eq('space_id', event.spaceID);
      log('✅ تم حذف العضو من space_members');
    } catch (e) {
      log('❌ خطأ أثناء الحذف: $e');
    }
  }

  FutureOr<void> addComment(
    AddCommentEvent event,
    Emitter<SpaceState> emit,
  ) async {
    final comment = await _addCommentUseCase(
      CommentParams(
        comment: event.commentText,
        userID: event.userID,
        spaceID: event.spaceID,
      ),
    );

    comment.fold(
      (failure) => emit(GetSpaceFiled(message: failure.message)),
      (_) {},
    );
  }

  FutureOr<void> getSpaceLists(
    GetSpaceLists event,
    Emitter<SpaceState> emit,
  ) async {
    emit(SpaceLoading());
    final space = await _getSpaceListsUseCase(
      SpaceParams(spaceID: event.spaceID, userID: event.userID),
    );

    space.fold((failure) => emit(GetSpaceFiled(message: failure.message)), (
      space,
    ) {
      emit(
        GetSpaceSuccess(
          getSpaceinfo: space,
          getspaceusers: space.users,
          isMicEnabled: false,
          isAgoraInitialized: false,
        ),
      );

      _subscribeToMembers(space.id);
      _subscribeToComments(space.id);
    });
  }

  Future<void> _toggleMic(
    ToggleMicEvent event,
    Emitter<SpaceState> emit,
  ) async {
    if (state is GetSpaceSuccess) {
      final currentState = state as GetSpaceSuccess;
      final isMicEnabled = !currentState.isMicEnabled;

      try {
        if (isMicEnabled) {
          agoraService.unmuteLocalMic();
        } else {
          agoraService.muteLocalMic();
        }

        await supabase
            .from('space_members')
            .update({'is_muted': !isMicEnabled})
            .eq('user_id', event.userID)
            .eq('space_id', currentState.getSpaceinfo.id);
        final updatedUsers = currentState.getspaceusers.map((user) {
          if (user['user_id'] == event.userID) {
            return {...user, 'is_muted': !isMicEnabled};
          }
          return user;
        }).toList();

        emit(
          currentState.copyWith(
            isMicEnabled: isMicEnabled,
            getspaceusers: updatedUsers,
          ),
        );
      } catch (e) {
        log('❌ فشل تحديث حالة الميكروفون في Supabase: $e');
      }
    }
  }

  Future<void> _initAgora(
    InitAgoraEvent event,
    Emitter<SpaceState> emit,
  ) async {
    if (state is GetSpaceSuccess) {
      final currentState = state as GetSpaceSuccess;
      try {
        await agoraService.initWithUserAccount(
          appId: '59fd63f1b8fa4761b7900a1d9bc8992b',
          token: event.token,
          channelName: event.channelName,
          userAccount: supabase.auth.currentUser!.id,
        );
        emit(currentState.copyWith(isAgoraInitialized: true));
      } catch (e) {
        log('Agora error: $e');
      }
    }
  }

  void _subscribeToMembers(String spaceId) {
    _membersChannel?.unsubscribe();

    _membersChannel = supabase.channel('space_members_$spaceId');

    _membersChannel!
      ..onPostgresChanges(
        event: PostgresChangeEvent.all,
        schema: 'public',
        table: 'space_members',
        filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: 'space_id',
          value: spaceId,
        ),
        callback: (payload) async {
          final membersResponse = await supabase
              .from('space_members')
              .select(
                'is_muted,user_id, user_profiles:user_id(avatar_url, full_name)',
              )
              .eq('space_id', spaceId);

          final members = (membersResponse as List<dynamic>).map((item) {
            final profile = item['user_profiles'];
            return {
              'name': profile['full_name'] ?? '',
              'avatar_url': profile['avatar_url'],
              'is_muted': item['is_muted'],
              'user_id': item['user_id'],
            };
          }).toList();

          add(UpdateMembersEvent(members));
        },
      )
      ..subscribe();
  }

  void _subscribeToComments(String spaceId) {
    _commentsChannel?.unsubscribe();

    _commentsChannel = supabase.channel('space_chats_full_$spaceId');

    _commentsChannel!
      ..onPostgresChanges(
        event: PostgresChangeEvent.insert,
        schema: 'public',
        table: 'space_chats_full',
        filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: 'space_id',
          value: spaceId,
        ),
        callback: (payload) {
          print('📥 Realtime full change received: ${payload.newRecord}');
          final newChat = payload.newRecord;
          final newComment = {
            'userID': newChat['user_id'] ?? '',
            'userName': newChat['user_name'] ?? '',
            'message': newChat['message'] ?? '',
            'sent_at': newChat['sent_at'],
          };
          add(UpdateCommentsEvent(newComment));
        },
      )
      ..subscribe();
  }

  void _onUpdateMembers(UpdateMembersEvent event, Emitter<SpaceState> emit) {
    if (state is GetSpaceSuccess) {
      final currentState = state as GetSpaceSuccess;
      emit(
        GetSpaceSuccess(
          getSpaceinfo: currentState.getSpaceinfo,
          getspaceusers: event.members,
          isMicEnabled: currentState.isMicEnabled,
          isAgoraInitialized: currentState.isAgoraInitialized,
        ),
      );
    }
  }

  void _onUpdateComments(UpdateCommentsEvent event, Emitter<SpaceState> emit) {
    if (state is GetSpaceSuccess) {
      final currentState = state as GetSpaceSuccess;
      final updatedComments = [
        ...currentState.getSpaceinfo.comments,
        event.newComment,
      ];
      emit(
        GetSpaceSuccess(
          getSpaceinfo: currentState.getSpaceinfo.copyWith(
            comments: updatedComments,
          ),
          getspaceusers: currentState.getspaceusers,
          isMicEnabled: currentState.isMicEnabled,
          isAgoraInitialized: currentState.isAgoraInitialized,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _membersChannel?.unsubscribe();
    _commentsChannel?.unsubscribe();
    return super.close();
  }
}
