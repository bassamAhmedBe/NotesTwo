import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_two/cubits/addNotes_cubits/add_notes_cubit_cubit.dart';
import 'package:note_two/models/note_models.dart';
import 'package:note_two/widgets/color_listView.dart';
import 'package:note_two/widgets/custom_button.dart';
import 'package:note_two/widgets/custom_textfield.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          CustomTextField(
            onsaved: (value) {
              title = value;
            },
            hintText: 'Title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onsaved: (value) {
              subtitle = value;
            },
            maxLine: 5,
            hintText: 'content',
          ),
    const      SizedBox(
            height: 10,
          ),
      const    ColorListView(),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<AddNotesCubitCubit, AddNotesCubitState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNotesCubitLoading ? true : false,
                ontab: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();

                    var currentDate = DateTime.now();
                    var formattedCurentDate =
                        DateFormat.yMd().format(currentDate);
                    var noteModel = NoteModels(
                      title: title!,
                      subtitle: subtitle!,
                      date: formattedCurentDate,
                      colors: Colors.blue.value,
                    );
                    BlocProvider.of<AddNotesCubitCubit>(context)
                        .addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}


