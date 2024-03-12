import 'package:dio/dio.dart';
import 'package:school_app/utils/constants/api_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkRepo {
  static BaseOptions options = BaseOptions(
    baseUrl: baseUrlAuth,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    headers: {},
    contentType: 'application/json; charset=utf-8',
    responseType: ResponseType.json,
  );
  static Future<dynamic> postRequest(String email, String password) async {
    final dio = Dio(options);
    try {
      final response = await dio.post(
        "${baseUrlAuth}login",
        data: {"username": email, "password": password},
      );
      // return UserModel.fromJson(response.data["data"]["user"]);
      return response.data["data"];
    } catch (e) {
      //return UserModel.fromJson({});
      return "";
    }
  }

  static Future<dynamic> getRequest() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    try {
      final dio = Dio(options.copyWith(headers: {
        "Authorization": "Bearer ${sharedPrefs.getString("token")}"
      }));
      final response = await dio.get(
        "${baseUrlAuth}user-info",
      );
      // print(response.data["data"]);
      // return UserModel.fromJson(response.data["data"]["user"]);
      return response.data["data"];
    } catch (e) {
      //return UserModel.fromJson({});
      return "";
    }
  }
}
