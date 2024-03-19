part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}

final class NotesLoading extends NotesState {}

final class NotesSuccess extends NotesState {
  final List<NoteModels> notes;

  NotesSuccess(this.notes);
}

final class NotesFailer extends NotesState {
  final String errorMessage;

  NotesFailer(this.errorMessage);
}
