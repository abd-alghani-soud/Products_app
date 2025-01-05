// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_code/blocs/auth/auth_bloc.dart';
import 'package:freezed_code/helper/show_snack_bar.dart';
import 'package:freezed_code/helper/show_snack_bar_with_color.dart';
import 'package:freezed_code/views/login_page.dart';
import 'package:freezed_code/views/products_page.dart';
import 'package:freezed_code/widgets/custom_button.dart';
import 'package:freezed_code/widgets/custom_text_field_email.dart';
import 'package:freezed_code/widgets/custom_text_field_password.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constant.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccsesState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ProductsPage()),
          );
        } else if (state is AuthFailureState) {
          if (state.errorMessage.contains("403") ||
              state.errorMessage.contains("network")) {
            showSnackBarWithColor(
                context, 'Network error, please try again later.', Colors.red);
          } else {
            showSnackBar(context, state.errorMessage);
          }
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoadingState;
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: kColorWh,
            body: Form(
              key: formKey,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.orange.shade300,
                      Colors.white,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 140,
                      child: Image.asset(
                        'assets/images/log.jpg',
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error,
                              size: 100, color: Colors.red);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 16,
                      ),
                      child: CustomTextFieldEmail(
                        onChanged: (data) {
                          email = data;
                        },
                        hintText: 'Email',
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: CustomTextFieldPassword(
                        hintText: 'Password',
                        onChanged: (data) {
                          password = data;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: CustomButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            if (email != null && password != null) {
                              BlocProvider.of<AuthBloc>(context).add(
                                SignUpRequestedEvent(
                                  email: email!,
                                  password: password!,
                                ),
                              );
                            } else {
                              showSnackBarWithColor(
                                context,
                                'Please fill in all fields.',
                                Colors.red,
                              );
                            }
                          }
                        },
                        text: 'Register',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                            fontSize: 18,
                            color: kColorBl,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 18,
                              color: kColorBl,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
