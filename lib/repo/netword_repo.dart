import 'package:dio/dio.dart';
import 'package:school_app/authentication/utils/constants/api_const.dart';
import 'package:school_app/models/user_model.dart';

class NetworkRepo {
  static BaseOptions options = BaseOptions(
    baseUrl: baseUrlAuth,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    headers: {},
    contentType: 'application/json; charset=utf-8',
    responseType: ResponseType.json,
  );
  static Future<UserModel> postRequest(String email, String password) async {
    final dio = Dio(options);
    try {
      final response = await dio.post(
        "${baseUrlAuth}login",
        data: {"username": email, "password": password},
      );
      return UserModel.fromJson(response.data["data"]["user"]);
    } catch (e) {
      return UserModel.fromJson({});
    }
  }
}
