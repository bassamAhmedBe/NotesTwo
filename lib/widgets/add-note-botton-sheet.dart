import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_two/cubits/cubit/add_notes_cubit_cubit.dart';
import 'package:note_two/widgets/Add-note-form.dart';

class AddNoteBottonShet extends StatelessWidget {
  const AddNoteBottonShet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: BlocConsumer<AddNotesCubitCubit, AddNotesCubitState>(
          listener: (context, state) {},
          builder: (context, state) {
            return AddNoteForm();
          },
        ),
      ),
    );
  }
}
