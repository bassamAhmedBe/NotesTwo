import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_two/cubits/notes_cubits/notes_cubit.dart';
import 'package:note_two/models/note_models.dart';
import 'package:note_two/widgets/custom_appBar.dart';
import 'package:note_two/widgets/custom_textfield.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModels note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomAppBar(
            onpressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subtitle = content ?? widget.note.subtitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            icon: Icons.check,
            title: 'Edit Note',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onchange: (value) {
              title = value;
            },
            hintText: widget.note.title,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onchange: (value) {
              content = value;
            },
            maxLine: 5,
            hintText: widget.note.subtitle,
          ),
        ],
      ),
    );
  }
}
