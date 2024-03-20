import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_two/cubits/notes_cubits/notes_cubit.dart';
import 'package:note_two/models/note_models.dart';
import 'package:note_two/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModels note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return  EditNoteView(
            note: note,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 14,
          bottom: 24,
          left: 16,
        ),
        decoration: BoxDecoration(
          color: Color(note.colors),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(fontSize: 26, color: Colors.black),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  note.subtitle,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.4),
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                note.date,
                style: TextStyle(
                    color: Colors.black.withOpacity(.4), fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
