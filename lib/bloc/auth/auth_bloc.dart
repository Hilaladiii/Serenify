import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:serenify/models/status_model.dart';
import 'package:serenify/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository = AuthRepository();

  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>((event, emit) async {
      try {
        emit(RegisterFetchLoading());
        final String fullname = event.fullname;
        final String email = event.email;
        final String birthDate = event.birthDay;
        final String password = event.password;
        final String confirmPassword = event.confirmPassword;

        if (password != confirmPassword) {
          emit(RegisterFetchFailure(
              "Password dan konfirmasi password tidak sama"));
          return;
        }
        final response = await authRepository.registerRepository(
            fullname, email, birthDate, password, confirmPassword);
        emit(RegisterFetchSucces(status: response));
      } catch (error) {
        emit(RegisterFetchFailure(error.toString()));
      }
    });
    on<LoginEvent>((event, emit) async {
      try {
        emit(LoginFetchLoading());
        String email = event.email;
        String password = event.password;
        final response = await authRepository.loginRepository(email, password);
        if (response.message == "email not verified") {
          return emit(LoginFetchFailure(response.message));
        }
        if (response.message == "invalid email or password") {
          return emit(LoginFetchFailure(response.message));
        }
        return emit(LoginFetchSuccess(token: response.data.toString()));
      } catch (e) {
        emit(LoginFetchFailure("Server Error ${e.toString()}"));
      }
    });
  }
}
