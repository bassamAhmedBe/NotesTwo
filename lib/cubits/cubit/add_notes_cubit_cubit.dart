import 'dart:js_interop';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_two/constant.dart';
import 'package:note_two/models/note_models.dart';

part 'add_notes_cubit_state.dart';

class AddNotesCubitCubit extends Cubit<AddNotesCubitState> {
  AddNotesCubitCubit() : super(AddNotesCubitInitial());

  addNote(NoteModels note) async {
    emit(AddNotesCubitLoading());

    try {
      var notebox = Hive.box<NoteModels>(kNotesBox);

      await notebox.add(note);
      emit(AddNotesCubitISucces());
    } catch (e) {
      emit(AddNotesCubitFailure(e.toString()));
    }
  }
}
