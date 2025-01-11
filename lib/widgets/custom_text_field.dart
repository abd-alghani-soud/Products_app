import 'package:flutter/material.dart';
import 'package:freezed_code/constant.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.keyboardType = TextInputType.text,
      this.onChanged,
      required this.hintText,
      super.key});

  final String hintText;
  void Function(String)? onChanged;
  TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      // onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 18,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kColorBl,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kColorBl,
          ),
        ),
      ),
    );
  }
}
