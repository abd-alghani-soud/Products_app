// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:freezed_code/constant.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.onTap, required this.text, super.key});

  final String text;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: kColorOr,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            kColorOr,
          ),
          foregroundColor: WidgetStateProperty.all(
            kColorBl,
          ),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 22,
            color: kColorBl,
          ),
        ),
      ),
    );
  }
}
