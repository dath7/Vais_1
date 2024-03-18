import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:school_app/repo/shared_prefs_repo.dart';
import 'package:school_app/utils/constants/api_const.dart';

class NetworkRepo {
  static const storage = FlutterSecureStorage();
  static BaseOptions options = BaseOptions(
    baseUrl: baseUrlAuth,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    headers: {},
    contentType: 'application/json',
    responseType: ResponseType.json,
  );
  static Future<dynamic> postRequest(String email, String password) async {
    final dio = Dio(options);

    try {
      final response = await dio.post(
        "$baseUrlAuth/login",
        data: {"username": email, "password": password},
      );

      // await storage.write(
      //     key: 'access_token',
      //     value: response.data["tokens"]["access"]["token"]);
      // await storage.write(
      //     key: 'refresh_token',
      //     value: response.data["tokens"]["refresh"]["token"]);
      // return UserModel.fromJson(response.data["data"]["user"]);
      return response.data["data"];
    } catch (e) {
      //return UserModel.fromJson({});
      return "";
    }
  }

  static Future<dynamic> getRequest() async {
    try {
      final token = await SharedPreprerencesRepo.getInfo();

      var dio =
          Dio(options.copyWith(headers: {"Authorization": "Bearer $token"}));

      final response = await dio.get(
        "$baseUrlAuth/user-info",
      );

      // print(response.data["data"]);
      return response.data["data"]["record"];
      // if (response.statusCode == 200) {
      //   return response.data["data"];
      // } else if (response.statusCode == 401) {
      //   final refreshToken = await storage.read(key: 'refresh_token');
      //   dio = Dio(options.copyWith(
      //     headers: {
      //       'grant_type': 'refresh_token',
      //       'refresh_token': '$refreshToken'
      //     },
      //   ));
      //   final response = await dio
      //       .post("${baseUrlAuth}refresh-token", data: {"refreshToken": ""});
      //   await storage.write(
      //       key: 'access_token',
      //       value: response.data["tokens"]["access"]["token"]);
      //   await storage.write(
      //       key: 'refresh_token',
      //       value: response.data["tokens"]["refresh"]["token"]);
      //   return response.data["data"];
    } catch (e) {
      //return UserModel.fromJson({});
      return "";
    }
  }
}
