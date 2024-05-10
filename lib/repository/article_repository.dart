import 'package:dio/dio.dart';
import 'package:serenify/models/article_model.dart';
import 'package:serenify/utils/api.dart';

class ArticleRepository {
  Dio dio = Dio();

  Future<ArticleData> getAllArticle() async {
    try {
      var response = await dio.get(ApiInstance().pathUrl('/article'));
      return ArticleData.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ArticleModel> getArticleById({required String id}) async {
    try {
      var response = await dio.get(ApiInstance().pathUrl('/article/$id'));
      print(response.data);
      return ArticleModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
