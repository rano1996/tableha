import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthorizationBloc {
  String _tokenString = "userAuthenticated";
  final BehaviorSubject _isSessionValid = BehaviorSubject<bool>();
  BehaviorSubject<bool> get isSessionValid => _isSessionValid;
  void dispose() {
    _isSessionValid.close();
  }

  void restoreSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _tokenString = prefs.get("token");
    if (_tokenString != null && _tokenString.length > 0) {
      _isSessionValid.sink.add(true);
    } else {
      _isSessionValid.sink.add(false);
    }
  }

  void openSession(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
    _tokenString = token;
    _isSessionValid.sink.add(true);
  }

  void closeSession(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    _isSessionValid.stream.listen(print);
    _isSessionValid.sink.add(false);

    Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
  }
}

final authBloc = AuthorizationBloc();
