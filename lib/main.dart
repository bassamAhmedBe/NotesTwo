import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_two/constant.dart';
import 'package:note_two/cubits/notes_cubits/notes_cubit.dart';

import 'package:note_two/models/note_models.dart';
import 'package:note_two/simple_bloc_observer.dart';
import 'package:note_two/views/note_view.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserve();

  Hive.registerAdapter(NoteModelsAdapter());
  await Hive.openBox<NoteModels>(kNotesBox);

  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        home: const NoteView(),
      ),
    );
  }
}
