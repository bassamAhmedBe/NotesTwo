import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:note_two/cubits/cubit/add_notes_cubit_cubit.dart';
import 'package:note_two/widgets/Add-note-form.dart';

class AddNoteBottonShet extends StatelessWidget {
  const AddNoteBottonShet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubitCubit(),
      child: BlocConsumer<AddNotesCubitCubit, AddNotesCubitState>(
        listener: (context, state) {
          if (state is AddNotesCubitISucces) {
            Navigator.pop(context);
          }

          if (state is AddNotesCubitFailure) {
            print('error ${state.errorMessage}');
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNotesCubitLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 16,
                  right: 16,
                  left: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(
                child: AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
