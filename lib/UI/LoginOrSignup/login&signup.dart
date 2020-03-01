import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:treva_shop_flutter/UI/LoginOrSignup/forgetpass.dart';
import 'package:treva_shop_flutter/UI/help/cusomDialog.dart';
import 'package:treva_shop_flutter/bloc/login.dart';

class signup extends StatefulWidget {
  @override
  RegistreActivit createState() => new RegistreActivit();
}

class RegistreActivit extends State<signup> with TickerProviderStateMixin {
  final _regKey = GlobalKey<FormState>();
  final _logKey = GlobalKey<FormState>();
  LoginBloc bloc;

  bool isChecked = false;
  var _temp;
  final _passSign = TextEditingController();
  final _fName = TextEditingController();
  final _lName = TextEditingController();
  final _emailSign = TextEditingController();
  final _password = TextEditingController();
  final _rePassword = TextEditingController();
  final _email = TextEditingController();

  TabController _controller;

  @override
  Future initState() {
    bloc = LoginBloc();
    // TODO: implement initState
    _controller = new TabController(length: 2, vsync: this);
    _passSign.clear();
    _password.clear();
    _rePassword.clear();
    _emailSign.clear();
    _email.clear();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: _setWidget(),
      ),
    );
  }

  Widget _setWidget() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10, 100, 10, 100),
            child: Container(
              child: Image.asset(
                'assets/tableha/Logo.png',
                // height: 25.0,
                width: 200,
                //  fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Column(
              children: <Widget>[
                Container(
                  child: new TabBar(
                    indicatorColor: Color(0xFFA8CF39),
                    controller: _controller,
                    tabs: [
                      // register
                      new Tab(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 19.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: "CaviarDreams",
                          ),
                        ),
                      ),
                      //login
                      new Tab(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 19.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: "CaviarDreams",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    height: 600,
                    //
                    child: TabBarView(
                      controller: _controller,
                      children: <Widget>[
                        ///first Tab Borrows
                        ///register
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
                          child: Form(
                            key: _regKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: _email,
                                  decoration: InputDecoration(
//                                  filled: true,
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                      color: Colors.black26,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "CaviarDreams",
                                    ),
                                    //can also add icon to the end of the textfiled
                                    //  suffixIcon: Icon(Icons.remove_red_eye),
                                  ),
                                  validator: (arg) {
                                    if (!isEmail(arg))
                                      return "Please Enter Valid Email";
                                    if (arg.trim().isEmpty)
                                      return "This Input is Empty";
                                    return null;
                                  },
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                  child: TextFormField(
                                    controller: _fName,
                                    decoration: InputDecoration(
//                                  filled: true,
                                      hintText: 'First Name',
                                      hintStyle: TextStyle(
                                        color: Colors.black26,
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "CaviarDreams",
                                      ),
                                      //can also add icon to the end of the textfiled
                                      //  suffixIcon: Icon(Icons.remove_red_eye),
                                    ),
                                    validator: (arg) {
                                      if (arg.length < 2)
                                        return "This Input Should be at least 2 letter";
                                      if (arg.length > 16)
                                        return "This Input must not exceeded 16 letter";
                                      if (arg.trim().isEmpty)
                                        return "This Input is Empty";
                                      return null;
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                  child: TextFormField(
                                    controller: _lName,
                                    decoration: InputDecoration(
//                                  filled: true,
                                      hintText: 'Last Name',
                                      hintStyle: TextStyle(
                                        color: Colors.black26,
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "CaviarDreams",
                                      ),
                                      //can also add icon to the end of the textfiled
                                      //  suffixIcon: Icon(Icons.remove_red_eye),
                                    ),
                                    validator: (arg) {
                                      if (arg.length < 2)
                                        return "This Input Should be at least 2 letter";
                                      if (arg.length > 16)
                                        return "This Input must not exceeded 16 letter";
                                      if (arg.trim().isEmpty)
                                        return "This Input is Empty";
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                                  child: TextFormField(
                                    controller: _password,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      filled: false,
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                        color: Colors.black26,
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "CaviarDreams",
                                      ),
                                      //can also add icon to the end of the textfiled
                                      //  suffixIcon: Icon(Icons.remove_red_eye),
                                    ),
                                    validator: (arg) {
                                      if (arg.length < 8)
                                        return "This Input Should be at least 8 letter";
                                      if (arg.length > 16)
                                        return "This Input must not exceeded 16 letter";
                                      if (arg.trim().isEmpty)
                                        return "This Input is Empty";
                                      return null;
                                    },
                                  ),
                                ),
                                TextFormField(
                                  controller: _rePassword,
                                  obscureText: true,
                                  decoration: InputDecoration(
//                                  filled: true,
                                    hintText: 'Re-Password',
                                    hintStyle: TextStyle(
                                      color: Colors.black26,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "CaviarDreams",
                                    ),
                                    //can also add icon to the end of the textfiled
                                    //  suffixIcon: Icon(Icons.remove_red_eye),
                                  ),
                                  validator: (arg) {
                                    if (arg.length < 8)
                                      return "This Input Should be at least 8 letter";
                                    if (arg.length > 16)
                                      return "This Input must not exceeded 16 letter";
                                    if (arg.trim().isEmpty)
                                      return "This Input is Empty";
                                    return null;
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 85, 20, 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xFFA8CF39),
                                        border: Border.all(
                                            color: Colors.white, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: FlatButton(
                                      padding:
                                          EdgeInsets.fromLTRB(80, 0, 80, 0),
                                      onPressed: _signupForm,
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: "CaviarDreams",
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        //login
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: Form(
                            key: _logKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: _emailSign,
                                  decoration: InputDecoration(
//                                  filled: true,
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                      color: Colors.black26,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "CaviarDreams",
                                    ),
                                    //can also add icon to the end of the textfiled
                                    //  suffixIcon: Icon(Icons.remove_red_eye),
                                  ),
//                                  validator: (arg) {
//                                    if (!isEmail(arg))
//                                      return "Please Enter Valid Email";
//                                    if (arg.trim().isEmpty)
//                                      return "This Input is Empty";
//                                    return null;
//                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                  child: TextFormField(
                                    controller: _passSign,
                                    obscureText: true,
                                    decoration: InputDecoration(
//                                    filled: true,
                                      hintText: 'Passsword',
                                      hintStyle: TextStyle(
                                        color: Colors.black26,
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "CaviarDreams",
                                      ),
                                      //can also add icon to the end of the textfiled
                                      //  suffixIcon: Icon(Icons.remove_red_eye),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 100, 20, 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xFFA8CF39),
                                        border: Border.all(
                                            color: Colors.white, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: FlatButton(
                                      padding:
                                          EdgeInsets.fromLTRB(80, 0, 80, 0),
                                      onPressed: _loginForm,
                                      child: Text(
                                        'Sign In',
                                        style: TextStyle(
//                                          color: Colors.black26,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: "CaviarDreams",
                                          color: Colors.white,
//                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          PageRouteBuilder(
                                              pageBuilder: (_, __, ___) =>
                                                  ForgetPassword()));
                                    },
                                    child: Text(
                                      'Forget Password',
                                      style: TextStyle(
                                          color: Colors.black26,
                                          fontSize: 21.0,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "CaviarDreams"),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  bool isEmail(String s) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(s))
      return false;
    else
      return true;
  }

  _signupForm() async {
    if (!_regKey.currentState.validate()) {
//      setState(() {
//        loading=false;
//      });
//    If all data are not valid then start auto validation.
      return null;
    }
    if (_password.text != _rePassword.text) {
//      setState(() {
//        loading=false;
//      });
      return showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialog(
          title: "Error",
          description: "The Password and confirm Password doesn't Match",
          buttonText: "ok",
        ),
      );
    }
    print("===");
    await print(bloc
        .signup(
            fname: _fName.text,
            lname: _lName.text,
            conPass: _rePassword.text,
            email: _email.text,
            pass: _password.text)
        .then((val) {
      print("val is $val");
      if (val.res) {
        setState(() {
//          tap = 1;
          print("i m in setSatte");
          //navigate to home
          Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
        });
      } else {
        print("you not loggeg in correctly");
//        setState(() {
//          loading=false;
//        });
        showDialog(
          context: context,
          builder: (BuildContext context) => CustomDialog(
            title: "Error",
            description: val.msg,
//                                                AppLocalizations.of(context).tr("dialog.again"),
            buttonText: "ok",
          ),
        );
      }
    }));
    print("else");
  }

  _loginForm() async {
    if (!_logKey.currentState.validate()) {
//    If all data are not valid then start auto validation.
      return null;
    }
    print("===");
    await print(bloc.submit(_emailSign.text, _passSign.text).then((val) {
      print("val is $val");
      if (val) {
        Navigator.pushNamedAndRemoveUntil(context, 'login', (_) => false);

//        setState(() {
//          tap = 1;
//          print("i m in setSatte");
//          new LoginAnimation(
//            animationController:
//            sanimationController.view,
//          );
//          _PlayAnimation();
//        });
      } else {
        print("you not loggeg in correctly");
        showDialog(
          context: context,
          builder: (BuildContext context) => CustomDialog(
            title: "Error",
            description: "Email or Password not correct",
            buttonText: "OK",
          ),
        );
      }
    }));
    print("else");
  }
}
