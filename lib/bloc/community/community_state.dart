part of 'community_bloc.dart';

@immutable
abstract class CommunityState {}

final class CommunityInitial extends CommunityState {}

final class CreatePostFetchLoading extends CommunityState {}

final class GetAllPostFetchLoading extends CommunityState {}

final class GetPostByIdFetchLoading extends CommunityState {}

final class CreateCommentFetchLoading extends CommunityState {}

final class CreatePostFetchSuccess extends CommunityState {
  final String message;
  CreatePostFetchSuccess({required this.message});
}

final class CreatePostFetchFailure extends CommunityState {
  final String error;
  CreatePostFetchFailure(this.error);
}

final class GetAllPostSuccess extends CommunityState {
  final List<PostModel> post;
  GetAllPostSuccess({required this.post});
}

final class GetAllPostFetchFailure extends CommunityState {
  final String error;
  GetAllPostFetchFailure(this.error);
}

final class GetPostByIdSuccess extends CommunityState {
  final DetailPostModel detailPost;
  GetPostByIdSuccess({required this.detailPost});
}

final class GetPostByIdFetchFailure extends CommunityState {
  final String error;
  GetPostByIdFetchFailure(this.error);
}

final class CreateCommentSuccess extends CommunityState {}

final class CreateCommentFailure extends CommunityState {
  final String error;
  CreateCommentFailure(this.error);
}
