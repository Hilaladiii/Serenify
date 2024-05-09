part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterInitial extends AuthState {}

class RegisterFetchLoading extends AuthState {}

class RegisterFetchSucces extends AuthState {
  final StatusModel status;
  RegisterFetchSucces({required this.status});
}

class RegisterFetchFailure extends AuthState {
  final String error;
  RegisterFetchFailure(this.error);
}

class LoginFetchLoading extends AuthState {}

class LoginFetchSuccess extends AuthState {
  final String token;
  LoginFetchSuccess({required this.token});

  get state => token;
}

class LoginFetchFailure extends AuthState {
  final String status;
  LoginFetchFailure(this.status);
}
