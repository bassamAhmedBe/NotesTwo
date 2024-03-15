import 'package:flutter/material.dart';
import 'package:note_two/widgets/custom_button.dart';
import 'package:note_two/widgets/custom_textfield.dart';

class AddNoteBottonShet extends StatelessWidget {
  const AddNoteBottonShet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            CustomTextField(
              hintText: 'Title',
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextField(
              maxLine: 5,
              hintText: 'content',
            ),
            SizedBox(
              height: 16,
            ),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}
