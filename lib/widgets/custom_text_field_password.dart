import 'package:flutter/material.dart';
import 'package:freezed_code/constant.dart';

// ignore: must_be_immutable
class CustomTextFieldPassword extends StatelessWidget {
  CustomTextFieldPassword({this.onChanged, required this.hintText, super.key,});

  void Function(String)? onChanged;
  String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      validator: (data) {
        if (data!.isEmpty) {
          return "it's required";
        } else if (data.length < 8) {
          return "password At least 8 character";
        } else {
          return null;
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: const Icon(
          Icons.lock,
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
          color: kColorBl,
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
