part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class GetUserEvent extends UserEvent {
  final String token;
  GetUserEvent({required this.token});
}

class GetUserScoreEvent extends UserEvent {
  final String token;
  GetUserScoreEvent({required this.token});
}
