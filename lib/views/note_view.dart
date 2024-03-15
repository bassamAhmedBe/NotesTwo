import 'package:flutter/material.dart';
import 'package:note_two/widgets/add-note-botton-sheet.dart';
import 'package:note_two/widgets/note_view_body.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          showModalBottomSheet(
            
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              context: context,
              builder: (context) {
                return const AddNoteBottonShet();
              });
        },
        child: const Icon(Icons.add),
      ),
      body: const NoteViewBody(),
    );
  }
}
