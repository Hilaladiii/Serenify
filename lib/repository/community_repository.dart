import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:serenify/models/post_model.dart';
import 'package:serenify/models/status_model.dart';
import 'package:serenify/utils/api.dart';

class CommunityRepositroy {
  Dio dio = Dio();

  Future<StatusModel> createPost(
      {required String token,
      required String content,
      PlatformFile? photo}) async {
    try {
      FormData postData = FormData.fromMap({
        "content": content,
        if (photo != null) "photo": await MultipartFile.fromFile(photo.path!),
      });
      var response = await dio.post(ApiInstance().pathUrl('/post/create'),
          data: postData,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      return StatusModel.fromJson(response.data, null);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<DataPost> getAllPost() async {
    try {
      var response = await dio.get(ApiInstance().pathUrl('/post'));
      return DataPost.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<DetailPostModel> getPostById({required String id}) async {
    try {
      var response = await dio.get(ApiInstance().pathUrl('/post/$id'));
      return DetailPostModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<StatusModel> createComment(
      {required String token,
      required String comment,
      required String id}) async {
    try {
      var response = await dio.post(ApiInstance().pathUrl('/post/$id/comments'),
          options: Options(headers: {"Authorization": "Bearer $token"}),
          data: {"comment": comment});
      print(response.data);
      return StatusModel.fromJson(response.data, null);
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }
}
