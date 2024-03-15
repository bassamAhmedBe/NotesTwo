import 'package:flutter/material.dart';
import 'package:note_two/constant.dart';
import 'package:note_two/widgets/custom_appBar.dart';
import 'package:note_two/widgets/custom_note_item.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          CustomAppBar(),
          SizedBox(
            height: 10,
          ),
          NoteItem(),
        ],
      ),
    );
  }
}
