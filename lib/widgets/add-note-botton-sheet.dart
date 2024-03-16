import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_two/cubits/cubit/add_notes_cubit_cubit.dart';
import 'package:note_two/widgets/Add-note-form.dart';

class AddNoteBottonShet extends StatelessWidget {
  const AddNoteBottonShet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(16),
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
          return ModalProgressHUD(
            inAsyncCall: state is AddNotesCubitLoading ? true : false,
            child:const SingleChildScrollView(
              child:  AddNoteForm(),
            ),
          );
        },
      ),
    );
  }
}
