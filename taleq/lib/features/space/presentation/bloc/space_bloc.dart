import 'dart:async';

import 'package:dartz/dartz.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taleq/features/space/domain/usecases/get_space.dart';
import 'package:taleq/features/space/presentation/bloc/space_event.dart';
import 'package:taleq/features/space/presentation/bloc/space_state.dart';

class SpaceBloc extends Bloc<SpaceEvent, SpaceState> {
  final GetSpaceListsUseCase _getSpaceListsUseCase;
  final SupabaseClient supabase;

  // للاشتراك في القنوات (channels)
  RealtimeChannel? _membersChannel;
  RealtimeChannel? _commentsChannel;

  SpaceBloc(this._getSpaceListsUseCase, this.supabase) : super(SpaceInitial()) {
    on<GetSpaceLists>(getSpaceLists);
    on<UpdateMembersEvent>(_onUpdateMembers);
    on<UpdateCommentsEvent>(_onUpdateComments);
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
      emit(GetSpaceSuccess(getSpaceinfo: space, getspaceusers: space.users));

      _subscribeToMembers(space.id);
      _subscribeToComments(space.id);
    });
  }

  void _subscribeToMembers(String spaceId) {
    _membersChannel?.unsubscribe();

    _membersChannel = supabase.channel('public:space_members_$spaceId');

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
              .select('user_profiles:user_id(avatar_url, full_name)')
              .eq('space_id', spaceId);

          final members = (membersResponse as List<dynamic>).map((item) {
            final profile = item['user_profiles'];
            return {
              'name': profile['full_name'] ?? '',
              'avatar_url': profile['avatar_url'],
            };
          }).toList();

          add(UpdateMembersEvent(members));
        },
      )
      ..subscribe();
  }

  void _subscribeToComments(String spaceId) {
    _commentsChannel?.unsubscribe();

    _commentsChannel = supabase.channel('public:space_chats_$spaceId');
    _commentsChannel!
      ..onPostgresChanges(
        event: PostgresChangeEvent.insert,
        schema: 'public',
        table: 'space_chats',
        filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: 'space_id',
          value: spaceId,
        ),
        callback: (payload) {
          final newChat = payload.newRecord;
          final newComment = {
            'user': newChat['user_profiles']?['full_name'] ?? '',
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
