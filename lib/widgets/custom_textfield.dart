import 'package:flutter/material.dart';
import 'package:note_two/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxLine = 1,
    this.onsaved, this.onchange,
  });
  final String hintText;
  final int maxLine;
  final Function(String?)? onsaved;
  final Function(String)? onchange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onchange ,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'feild is requied';
        } else {
          return null;
        }
      },
      onSaved: onsaved,
      cursorColor: kPrimaryColor,
      maxLines: maxLine,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: kPrimaryColor, fontSize: 20),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(
          kPrimaryColor,
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
