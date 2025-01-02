import 'package:flutter/material.dart';
import 'package:freezed_code/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.text, super.key});

  final String text;

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
        onPressed: () {},
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
