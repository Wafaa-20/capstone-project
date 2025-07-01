part of 'words_bloc.dart';

sealed class WordsState extends Equatable {
  const WordsState();
  
  @override
  List<Object> get props => [];
}

final class WordsInitial extends WordsState {}
