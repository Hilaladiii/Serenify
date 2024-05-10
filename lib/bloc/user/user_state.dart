part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

class GetUserFetchLoading extends UserState {}

class GetUserFetchSuccess extends UserState {
  final UserModel user;
  GetUserFetchSuccess({required this.user});
}

class GetUserFetchFailure extends UserState {
  final String error;
  GetUserFetchFailure(this.error);
}

class GetUserScoreFetchLoading extends UserState {}

class GetUserScoreFetchSuccess extends UserState {
  final UserScoreModel userScore;
  GetUserScoreFetchSuccess({required this.userScore});
}

class GetUserScoreFetchFailure extends UserState {
  final String error;
  GetUserScoreFetchFailure(this.error);
}
