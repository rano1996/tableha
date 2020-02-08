import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/UI/AcountUIComponent/changePassword.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/Search.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/favoritePage.dart';
import 'package:treva_shop_flutter/UI/help/colors.dart';
import 'package:treva_shop_flutter/models/user.dart';

class myProfile extends StatefulWidget {
  @override
  _myProfileState createState() => _myProfileState();
}

class _myProfileState extends State<myProfile> {
  static var _txtCustomSub = TextStyle(
    color: Colors.black54,
    fontSize: 19.0,
    fontWeight: FontWeight.w600,
    fontFamily: "CaviarDreams",
  );

  bool edit = false;
  bool _autovalidator = false;
  TextEditingController email = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    /// Declare MediaQueryData
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.white,

      /// Use Stack to costume a appbar
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                padding:
                    EdgeInsets.only(top: mediaQueryData.padding.top + 65.5),
                child: Column(
                  children: <Widget>[
                    settingNew(context),
                  ],
                ),
              ),
            ),
            AppBar(context, statusBarHeight),
          ],
        ),
      ),
    );
  }

  Widget settingNew(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        height: 400.0,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //open profile

              InkWell(
                onTap: () {
                  setState(() {
                    edit = true;
                  });
//                Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_,__,___)=> myProfile()))
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        edit
                            ? Container(
                                width: MediaQuery.of(context).size.width - 180,
                                child: Form(
                                  key: _key,
                                  autovalidate: _autovalidator,
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    obscureText: false,
                                    decoration: const InputDecoration(
                                      labelText: "Edit Email",
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 19.0,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "CaviarDreams",
                                      ),
                                    ),
                                    controller: email,
                                    validator: (String value) {
                                      setState(() {
                                        _autovalidator = true;
                                      });
                                      Pattern pattern =
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                      RegExp regex = new RegExp(pattern);
                                      if (!regex.hasMatch(value))
                                        return 'Enter Valid Email';
                                      if (value.trim().isEmpty) {
                                        return 'Password is required';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              )
                            : Text(
                                user.email,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "CaviarDreams",
                                ),
                              ),

                        //correct sign
                        edit
                            ? InkWell(
                                onTap: () {
                                  if (_key.currentState.validate()) {
                                    user.email = email.text;
                                    email.text = null;
                                  } else {
                                    setState(() {
                                      _autovalidator = true;
                                    });
                                  }
                                  setState(() {
                                    edit = false;
                                  });
                                },
                                child: Icon(
                                  Icons.check_circle,
                                  color: Colors.black38,
                                ),
                              )
                            : Container(),
                        edit
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    edit = false;
                                  });
                                },
                                child: Icon(
                                  Icons.cancel,
                                  color: Colors.black38,
                                ),
                              )
                            : Container()
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: Divider(
                  color: Colors.black12,
                  height: 0.5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (_, __, ___) => changePassword()));
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Change Pasword",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 19.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: "CaviarDreams",
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black38,
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget AppBar(BuildContext context, double statusBarHeight) {
    final MediaQueryData media = MediaQuery.of(context);

    return Container(
      padding:
          EdgeInsets.only(top: statusBarHeight, left: 25, right: 25, bottom: 3),
      height: 58.0 + statusBarHeight,
      decoration: BoxDecoration(
        color: hexToColor('#A8CF39'),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //left side
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //back button
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: media.devicePixelRatio + 17.0,
                  ),
                ),

                SizedBox(
                  width: 20,
                ),

                /// if user click shape white in appbar navigate to search layout
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => searchAppbar(),

                          /// transtation duration in animation
                          transitionDuration: Duration(milliseconds: 750),

                          /// animation route to search layout
                          transitionsBuilder: (_, Animation<double> animation,
                              __, Widget child) {
                            return Opacity(
                              opacity: animation.value,
                              child: child,
                            );
                          }),
                    );
                  },

                  /// Create shape background white in appbar (background treva shop text)
                  child: Container(
                    margin: EdgeInsets.only(
//                        left: media.padding.left + 15,
                        right: media.padding.left + 26),
                    child: Image.asset(
                      "assets/tableha/Search_app.png",
                      height: media.devicePixelRatio + 28.0,
                    ),
                  ),
                ),

                /// Icon chat (if user click navigate to Favorite layout)
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => FavoritePage(),

                          /// transtation duration in animation
                          transitionDuration: Duration(milliseconds: 750),

                          /// animation route to search layout
                          transitionsBuilder: (_, Animation<double> animation,
                              __, Widget child) {
                            return Opacity(
                              opacity: animation.value,
                              child: child,
                            );
                          }),
                    );
                  },
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: media.devicePixelRatio + 32.0,
                  ),
                ),
              ],
            ),
          ),

          /// Icon notification (if user click navigate to notification layout)
          InkWell(
            onTap: () {
//              Navigator.of(context).push(PageRouteBuilder(
//                  pageBuilder: (_, __, ___) => new notification()));
            },
            child: Container(
              child: Text(
                'My Profile',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'CaviarDreams',
                    fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
