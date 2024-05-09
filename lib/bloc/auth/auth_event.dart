part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String fullname;
  final String email;
  final String birthDay;
  final String password;
  final String confirmPassword;

  RegisterEvent(
      {required this.fullname,
      required this.email,
      required this.birthDay,
      required this.password,
      required this.confirmPassword});
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}
