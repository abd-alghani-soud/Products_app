import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthBloc() : super(AuthInitial()) {
    on<LoginRequestedEvent>(
      (event, emit) async {
        emit(AuthLoadingState());
        try {
          await _auth.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          emit(AuthSuccsesState());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(AuthFailureState(
                errorMessage: 'No user found for that email.'));
          } else if (e.code == 'wrong-password') {
            emit(AuthFailureState(errorMessage: 'Wrong password provided.'));
          } else if (e.code == 'invalid-email') {
            emit(AuthFailureState(
                errorMessage: 'The email address is invalid.'));
          } else {
            emit(AuthFailureState(
                errorMessage:
                    'An unknown error occurred: ${e.message ?? "Unknown error"}'));
          }
        } catch (e) {
          emit(AuthFailureState(
              errorMessage: 'An error occurred during login: ${e.toString()}'));
        }
      },
    );

    on<SignUpRequestedEvent>(
      (event, emit) async {
        emit(AuthLoadingState());
        try {
          await _auth.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          emit(AuthSuccsesState());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'email-already-in-use') {
            emit(AuthFailureState(
                errorMessage: 'The email address is already in use.'));
          } else if (e.code == 'weak-password') {
            emit(AuthFailureState(errorMessage: 'The password is too weak.'));
          } else if (e.code == 'invalid-email') {
            emit(AuthFailureState(
                errorMessage: 'The email address is invalid.'));
          } else {
            emit(AuthFailureState(
                errorMessage:
                    'An unknown error occurred: ${e.message ?? "Unknown error"}'));
          }
        } catch (e) {
          emit(AuthFailureState(
              errorMessage:
                  'An error occurred during signup: ${e.toString()}'));
        }
      },
    );

    on<CheakAuthStatusEvent>(
      (event, emit) {
        final user = _auth.currentUser;
        if (user != null) {
          emit(AuthSuccsesState());
        } else {
          emit(AuthInitial());
        }
      },
    );
  }
}
