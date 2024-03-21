import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:school_app/repo/shared_prefs_repo.dart';
import 'package:school_app/utils/constants/api_const.dart';
import 'package:school_app/utils/constants/string_const.dart';

class NetworkRepo {
  static const storage = FlutterSecureStorage();
  static BaseOptions options = BaseOptions(
    baseUrl: BASE_URL,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {},
    contentType: CONTENT_TYPE,
    responseType: ResponseType.json,
  );
  static Future<dynamic> postRequest(String email, String password) async {
    final dio = Dio(
      options,
    );

    try {
      //  print("a");

      final response = await dio.post(
        "$BASE_URL/login",
        data: {"username": email, "password": password},
      );
      //print(response.data);
      // await storage.write(
      //     key: 'access_token',
      //     value: response.data["tokens"]["access"]["token"]);
      // await storage.write(
      //     key: 'refresh_token',
      //     value: response.data["tokens"]["refresh"]["token"]);
      // return UserModel.fromJson(response.data["data"]["user"]);

      return response.data["data"];
    }
    // } on DioException catch (e) {
    //   // return e.response!.data["message"];
    //   return "message";
    // }
    catch (e) {
      if (e is DioException) {
        return ErrorMessage.convert(e.type);
      }
    }
  }

  static Future<dynamic> getRequest() async {
    try {
      final token = await SharedPreprerencesRepo.getInfo();

      var dio =
          Dio(options.copyWith(headers: {AUTHORIZATION: "Bearer $token"}));

      final response = await dio.get(
        "$BASE_URL/user-info",
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

class ErrorMessage {
  static String convert(DioExceptionType errorType) {
    switch (errorType) {
      case DioExceptionType.badCertificate:
        return NetworkErrorMessage.badCertificate;
      case DioExceptionType.badResponse:
        return NetworkErrorMessage.badResponse;
      case DioExceptionType.cancel:
        return NetworkErrorMessage.cancel;
      case DioExceptionType.connectionError:
        return NetworkErrorMessage.connectionError;
      case DioExceptionType.connectionTimeout:
        return NetworkErrorMessage.connectionError;
      case DioExceptionType.receiveTimeout:
        return NetworkErrorMessage.recevingTimeout;
      case DioExceptionType.sendTimeout:
        return NetworkErrorMessage.sendUrlTimeout;
      case DioExceptionType.unknown:
        return NetworkErrorMessage.unknown;
    }
  }
}
