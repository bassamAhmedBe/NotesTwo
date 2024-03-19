part of 'add_notes_cubit_cubit.dart';

sealed class AddNotesCubitState {}

final class AddNotesCubitInitial extends AddNotesCubitState {}

final class AddNotesCubitLoading extends AddNotesCubitState {}

final class AddNotesCubitISucces extends AddNotesCubitState {}

class AddNotesCubitFailure extends AddNotesCubitState {
  final String errorMessage;
  AddNotesCubitFailure(this.errorMessage);
}
