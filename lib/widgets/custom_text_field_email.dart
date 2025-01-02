import 'package:flutter/material.dart';
import 'package:freezed_code/constant.dart';

// ignore: must_be_immutable
class CustomTextFieldEmail extends StatefulWidget {
  CustomTextFieldEmail({required this.hintText, super.key});

  String hintText;

  @override
  State<CustomTextFieldEmail> createState() => _CustomTextFieldEmailState();
}

class _CustomTextFieldEmailState extends State<CustomTextFieldEmail> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      // validator: (data) {
      //   if (data!.isEmpty) {
      //     return "it's required";
      //   } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.com$').hasMatch(data)) {
      //     return "please enter a valid email";
      //   }
      // },
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
        hintText: widget.hintText,
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
