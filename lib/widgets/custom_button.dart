import 'package:flutter/material.dart';
import 'package:note_two/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.ontab, this.isLoading = false});
  final Function()? ontab;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontab,
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.black,
                )
              : const Text(
                  'Add',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
        ),
      ),
    );
  }
}
