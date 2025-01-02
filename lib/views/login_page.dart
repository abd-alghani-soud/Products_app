import 'package:flutter/material.dart';
import 'package:freezed_code/constant.dart';
import 'package:freezed_code/views/sign_up_page.dart';
import 'package:freezed_code/widgets/custom_button.dart';
import 'package:freezed_code/widgets/custom_text_field_email.dart';
import 'package:freezed_code/widgets/custom_text_field_password.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorWh,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(
            flex: 1,
          ),
          SizedBox(
            height: 150,
            child: Image.asset('assets/images/logs.jpg'),
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Log In',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8,
            ),
            child: CustomTextFieldEmail(
              hintText: 'Email',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: CustomTextFieldPassword(
              hintText: 'Password',
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomButton(text: 'Login'),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "don't have an accounts ?",
                style: TextStyle(
                  fontSize: 18,
                  color: kColorBl,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpPage(),
                    ),
                  );
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 18,
                    color: kColorBl,
                  ),
                ),
              )
            ],
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
