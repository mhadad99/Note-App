part of 'notes_cubit.dart';

abstract class NotesState {}

final class NotesInitial extends NotesState {}

final class NotesLoading extends NotesState {}

final class NotesSuccess extends NotesState {
  final List<NoteModel> notes;

  NotesSuccess(this.notes);
}

final class NotesFailure extends NotesState {
  final String error;

  NotesFailure(this.error);
}
