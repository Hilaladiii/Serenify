import 'package:dio/dio.dart';
import 'package:serenify/models/test_model.dart';
import 'package:serenify/utils/api.dart';

class TestRepository {
  Dio dio = Dio();

  Future<TestModel> evaluateTest(
      {required List<String> answers, required String token}) async {
    try {
      var response = await dio.post(ApiInstance().pathUrl('/answer/evaluate'),
          data: {"answer": answers},
          options: Options(headers: {"Authorization": "Bearer $token"}));
      return TestModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
