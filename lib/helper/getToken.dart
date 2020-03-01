import 'package:shared_preferences/shared_preferences.dart';

getToken() async {
  var preferences = await SharedPreferences.getInstance();
  String token = preferences.getString('token');
  return token;
}
