import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serenify/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:serenify/repository/auth_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  AuthRepository authRepository = AuthRepository();
  UserBloc() : super(UserInitial()) {
    on<GetUserEvent>((event, emit) async {
      try {
        emit(GetUserFetchLoading());
        var response = await authRepository.getUser(token: event.token);
        emit(GetUserFetchSuccess(user: response));
      } catch (e) {
        emit(GetUserFetchFailure(e.toString()));
      }
    });
    on<GetUserScoreEvent>((event, emit) async {
      try {
        emit(GetUserScoreFetchLoading());
        var response = await authRepository.getUserScore(token: event.token);
        emit(GetUserScoreFetchSuccess(userScore: response));
      } catch (e) {
        emit(GetUserScoreFetchFailure(e.toString()));
      }
    });
  }
}
