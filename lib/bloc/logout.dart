import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/bloc/authentication.dart';

class LogoutBloc {
  logoutUser(BuildContext context) {
    print("logout bloc");
    authBloc.closeSession(context);
  }
}
