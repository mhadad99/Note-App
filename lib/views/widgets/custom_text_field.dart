import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.maxLines = 1, required this.hint});
  final int maxLines;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: buildBorder(),
        focusedBorder: buildBorder(color: kPrimaryColor),
        enabledBorder: buildBorder(),
        hintText: hint,
      ),
    );
  }

  OutlineInputBorder buildBorder({color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: color ?? Colors.white,
        ));
  }
}
