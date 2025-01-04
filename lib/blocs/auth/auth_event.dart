part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginRequestedEvent extends AuthEvent {
  final String email, password;

  LoginRequestedEvent({required this.password, required this.email});
}

class SignUpRequestedEvent extends AuthEvent {
  final String email, password;

  SignUpRequestedEvent({required this.password, required this.email});
}

class CheakAuthStatusEvent extends AuthEvent {}
