import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/helper/error_tracing.dart';
import 'package:treva_shop_flutter/user_response.dart';

class AuthProvider {
  final String _endpoint = "http://tbllama-001-site1.atempurl.com/api/User/";

//  final Dio _dio = Dio();
  Dio _dio;

  AuthProvider() {
    _dio = Dio();
//    _dio.interceptors
//        .add(InterceptorsWrapper(onRequest: (Options option) async {
//      //my function to recovery token
////          await getToken().then((result) {
////            token = result;
////          });
//      option.headers = {
////            "Authorization": "Bearer $token"
//        "lang": "en"
//      };
//    }));
  }

  Future<UserResponse> login({
    @required String email,
    @required String password,
  }) async {
    try {
//      var preferences = await SharedPreferences.getInstance();
//      String token = preferences.getString('token');
//      String userId = preferences.getString('id');
      Map<String, String> data = {"email": email, "password": password};
      print("data before  is $data and endpoint is $_endpoint");
      Response response = await _dio.post(_endpoint + 'login', data: data);
      print("data is after : ${response.data}");
      return UserResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return UserResponse.withError(handleError(error));
    }
  }

  signin(@required Map<String, dynamic> data) async {
    try {
//      var preferences = await SharedPreferences.getInstance();
//      String token = preferences.getString('token');
//      String userId = preferences.getString('id');
      print("data before  is $data and endpoint is $_endpoint");
      Response response = await _dio.post(_endpoint + 'register', data: data);
      print("data is after : ${response.data}");
      return UserResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("error is ${error.hashCode}");
      print("Exception occured: $error stackTrace: $stacktrace");
      return UserResponse.withError(handleError(error));
    }
  }

//  Future<String> login({
//    @required String email,
//    @required String password,
//  }) async {
//    await Future.delayed(Duration(seconds: 1));
//    return 'token-info';
//  }
}
