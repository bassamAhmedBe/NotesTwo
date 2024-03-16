import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_two/constant.dart';
import 'package:note_two/cubits/cubit/add_notes_cubit_cubit.dart';
import 'package:note_two/models/note_models.dart';
import 'package:note_two/simple_bloc_observer.dart';
import 'package:note_two/views/note_view.dart';

void main() async {
  Bloc.observer = SimpleBlocObserve();

  await Hive.initFlutter();
  await Hive.openBox<NoteModels>(kNotesBox);

  Hive.registerAdapter(NoteModelsAdapter());
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNotesCubitCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        home: const NoteView(),
      ),
    );
  }
}
