part of 'notes_cubit.dart';

abstract class NotesState {}

final class NotesInitial extends NotesState {}

final class NotesSearch extends NotesState {}

final class NotesSuccess extends NotesState {}

final class NotesFailure extends NotesState {
  final String error;

  NotesFailure(this.error);
}
