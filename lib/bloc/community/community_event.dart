part of 'community_bloc.dart';

@immutable
abstract class CommunityEvent {}

final class CreatePostEvent extends CommunityEvent {
  final String token;
  final String content;
  final PlatformFile? photo;
  CreatePostEvent({required this.token, required this.content, this.photo});
}

final class GetAllPostEvent extends CommunityEvent {}

final class GetPostByIdEvent extends CommunityEvent {
  final String id;
  GetPostByIdEvent({required this.id});
}

final class CreateCommentEvent extends CommunityEvent {
  final String token;
  final String comment;
  final String id;

  CreateCommentEvent(
      {required this.token, required this.comment, required this.id});
}
