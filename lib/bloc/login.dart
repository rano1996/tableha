import 'package:rxdart/rxdart.dart';
import 'package:treva_shop_flutter/bloc/authentication.dart';
import 'package:treva_shop_flutter/helper/validate.dart';
import 'package:treva_shop_flutter/repo/login.dart';
import 'package:treva_shop_flutter/user_response.dart';

class LoginBloc extends Validators {
  AuthRepository repository = AuthRepository();
  final BehaviorSubject _emailController = BehaviorSubject<String>();
  final BehaviorSubject _passwordController = BehaviorSubject<String>();
  final PublishSubject _loadingData = PublishSubject<bool>();

  Function(String) get changeEmail => _emailController.sink.add;

  Function(String) get changePassword => _passwordController.sink.add;

  Stream<String> get email => _emailController.stream.transform(validateEmail);

  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (email, password) => true);

  Observable<bool> get loading => _loadingData.stream;

  Future<bool> submit(String email, String pass) async {
    bool is_logged;
    final validEmail = email;
    final validPassword = pass;
    print("start submit func $validEmail + $validPassword");

    _loadingData.sink.add(true);
    await login(validEmail, validPassword).then((val) {
      val ? is_logged = true : is_logged = false;
    });
//    is_logged = true;
    return is_logged;
  }

  Future<Res> signup(
      {String email,
      String pass,
      String lname,
      String conPass,
      String phone,
      String fname}) async {
    Res result;
    final validEmail = email;
    final validPassword = pass;
    print("start submit func $validEmail + $validPassword");

    _loadingData.sink.add(true);
    await signin(
            email: validEmail,
            pass: validPassword,
            conPass: conPass,
            phone: phone,
            lname: lname,
            fname: fname)
        .then((val) {
      result = val;
    });
//    is_logged = true;
    return result;
  }

  Future<bool> login(String email, String password) async {
    String token;
    UserResponse response = await repository.login(email, password);
    print('res ========= ${response}');
    if (response.isSuccessful == true) {
      token = "You logged in Succcessfully";
      print('response is ${token}');

      _loadingData.sink.add(false);
      authBloc.openSession(token);
      return true;
    } else {
      print(response.message);
      _loadingData.sink.add(true);
      return false;
    }
  }

  Future<Res> signin(
      {String email,
      String pass,
      String lname,
      String conPass,
      String phone,
      String fname}) async {
    String token;
    Map<String, dynamic> data = {
      "u_Lname": lname,
      "u_Fname": fname,
      "email": email,
      "password": pass,
//      "last_name":"datatode",
//      "bio_ar":"data to delete laterdata to delete laterdata to delete later",
//      "bio_en":"data to delete laterdata to delete laterdata to delete later",
    };
    Res result;
    var response = await repository.signin(data);
    print("the reeeeeeeeeeeeeeeeesponse is ${response.runtimeType}");
    print('res ========= ${response}');
    if (response.isSuccessful == true) {
      token = "Successful Logged in";
      print('response is ${token}');

      _loadingData.sink.add(false);
      authBloc.openSession(token);
      result = Res(true, "you sucessfully logged in");
//      result.msg = "you sucessfully logged in";
//      result.res = true;
      return result;
    } else {
      print(response.message);
      _loadingData.sink.add(true);
      result = Res(false, "Error");

//      result.msg = "Error";
//      result.res = false;
      return result;
    }
//
  }

  void dispose() {
    _emailController.close();
    _passwordController.close();
    _loadingData.close();
  }
}

class Res {
  String msg;
  bool res;

  Res(this.res, this.msg);
}
