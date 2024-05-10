import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:serenify/models/post_model.dart';
import 'package:serenify/repository/community_repository.dart';

part 'community_event.dart';
part 'community_state.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  CommunityRepositroy communityRepositroy = CommunityRepositroy();
  CommunityBloc() : super(CommunityInitial()) {
    on<CreatePostEvent>((event, emit) async {
      try {
        var response = await communityRepositroy.createPost(
            token: event.token, content: event.content, photo: event.photo);
        if (response.message == "post created successfully") {
          emit(CreatePostFetchSuccess(message: response.message));
        } else {
          emit(CreatePostFetchFailure(response.message));
        }
      } catch (e) {
        emit(CreatePostFetchFailure(e.toString()));
      }
    });
    on<GetAllPostEvent>((event, emit) async {
      try {
        emit(GetAllPostFetchLoading());
        var response = await communityRepositroy.getAllPost();
        emit(GetAllPostSuccess(post: response.dataPost));
      } catch (e) {
        emit(GetAllPostFetchFailure(e.toString()));
      }
    });
    on<GetPostByIdEvent>((event, emit) async {
      try {
        emit(GetPostByIdFetchLoading());
        var response = await communityRepositroy.getPostById(id: event.id);
        emit(GetPostByIdSuccess(detailPost: response));
      } catch (e) {
        emit(GetPostByIdFetchFailure(e.toString()));
      }
    });
    on<CreateCommentEvent>((event, emit) async {
      try {
        emit(CreateCommentFetchLoading());
        var resposne = await communityRepositroy.createComment(
            token: event.token, comment: event.comment, id: event.id);
        if (resposne.message == "comment created successfully") {
          emit(CreateCommentSuccess());
        } else {
          emit(CreateCommentFailure(
              "terjadi kegagalan silahkan coba lagi nanti"));
        }
      } catch (e) {
        emit(CreateCommentFailure(e.toString()));
      }
    });
  }
}
