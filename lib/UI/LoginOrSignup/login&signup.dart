import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:treva_shop_flutter/UI/LoginOrSignup/forgetpass.dart';

class signup extends StatefulWidget {
  @override
  RegistreActivit createState() => new RegistreActivit();
}

class RegistreActivit extends State<signup> with TickerProviderStateMixin {
  bool isChecked = false;
  var _temp;
  final _passSign = TextEditingController();
  final _emailSign = TextEditingController();
  final _password = TextEditingController();
  final _rePassword = TextEditingController();
  final _email = TextEditingController();

  TabController _controller;

  @override
  Future initState() {
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
                    height: 400,
                    child: TabBarView(
                      controller: _controller,
                      children: <Widget>[
                        ///first Tab Borrows
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
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
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                                child: TextFormField(
                                  controller: _password,
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
                                ),
                              ),
                              TextFormField(
                                controller: _rePassword,
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
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 85, 20, 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFA8CF39),
                                      border: Border.all(
                                          color: Colors.white, width: 1),
                                      borderRadius: BorderRadius.circular(100)),
                                  child: FlatButton(
                                    padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                                    onPressed: () {},
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19.0,
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
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
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
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                child: TextFormField(
                                  controller: _passSign,
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
                                      borderRadius: BorderRadius.circular(100)),
                                  child: FlatButton(
                                    padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                                    onPressed: () {},
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
//                                          color: Colors.black26,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
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
                                    Navigator.of(context).push(PageRouteBuilder(
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
}
