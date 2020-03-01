import 'package:dio/dio.dart';

class UserProvider {
  final String _endpoint = "http://tbllama-001-site1.atempurl.com/api/User/";

//  final Dio _dio = Dio();
  Dio _dio;
  String token;
  int userId;

  UserProvider() {
    _dio = Dio();
  }

//  Future<CommentResponse> getComments(String id) async {
//    try {
//      Response response =
//      await _dio.get(_endpoint + 'posts/' + id + '/comment');
//      print("comments is after : ${response.data}");
//      return CommentResponse.fromJson(response.data);
//    } catch (error, stacktrace) {
//      print("Exception occured: $error stackTrace: $stacktrace");
//      return CommentResponse.withError(handleError(error));
//    }
//  }

}
