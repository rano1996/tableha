import 'package:treva_shop_flutter/provider/auth.dart';
import 'package:treva_shop_flutter/user_response.dart';

class AuthRepository {
  final AuthProvider authProvider = AuthProvider();
  Future<UserResponse> login(String email, String password) =>
      authProvider.login(email: email, password: password);
  signin(Map<String, dynamic> data) => authProvider.signin(data);
}
