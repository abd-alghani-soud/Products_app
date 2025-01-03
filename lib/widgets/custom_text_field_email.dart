import 'package:flutter/material.dart';
import 'package:freezed_code/constant.dart';

// ignore: must_be_immutable
class CustomTextFieldEmail extends StatelessWidget {
  CustomTextFieldEmail(
      {required this.onChanged, required this.hintText, super.key});

  void Function(String)? onChanged;

  String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (data) {
        if (data!.isEmpty) {
          return "it's required";
        } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.com$')
            .hasMatch(data)) {
          return "please enter a valid email";
        } else {
          return null;
        }
      },
      // onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: const Icon(
          Icons.email,
          size: 28,
          color: kColorOr,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 18,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 22,
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
