import 'package:dio/dio.dart';
import 'package:serenify/models/seminar_model.dart';
import 'package:serenify/utils/api.dart';

class SeminarRepository {
  Dio dio = Dio();

  Future<SeminarData> getAllSeminar() async {
    try {
      var response = await dio.get(ApiInstance().pathUrl('/seminar'));
      return SeminarData.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<DetailSeminarModel> getSeminarById({required String id}) async {
    try {
      var response = await dio.get(ApiInstance().pathUrl('/seminar/$id'));
      return DetailSeminarModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
