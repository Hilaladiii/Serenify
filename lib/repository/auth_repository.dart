import 'package:dio/dio.dart';
import 'package:serenify/models/status_model.dart';
import 'package:serenify/utils/api.dart';

class AuthRepository {
  Dio dio = Dio();

  Future<StatusModel> registerRepository(String fullname, String email,
      String birthDate, String password, String confirmPassword) async {
    try {
      var response = await dio.post(ApiInstance().pathUrl('/auth/register'),
          data: {
            "birth_date": birthDate,
            "confirm_password": confirmPassword,
            "email": email,
            "full_name": fullname,
            "password": password,
          },
          options: Options(contentType: "application/json"));
      print(response.data);
      return StatusModel.fromJson(response.data, 'email');
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  Future<StatusModel> loginRepository(String email, String password) async {
    try {
      var response =
          await dio.post(ApiInstance().pathUrl('/auth/login'), data: {
        "email": email,
        "password": password,
      });

      if (response.statusCode == 401) {
        return StatusModel.fromJson(response.data, null);
      } else if (response.statusCode == 200) {
        return StatusModel.fromJson(response.data, null);
      } else {
        return StatusModel.fromJson(response.data, null);
      }
    } on DioException catch (e) {
      return StatusModel.fromJson(e.response!.data, null);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
