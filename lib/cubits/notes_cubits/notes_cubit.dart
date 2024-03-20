import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_two/constant.dart';

import 'package:note_two/models/note_models.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModels>? notes;

  fetchAllNotes() async {
    var notebox = Hive.box<NoteModels>(kNotesBox);

    notes = notebox.values.toList();
  }
}
