import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:treva_shop_flutter/UI/AcountUIComponent/SettingAcount.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/Search.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/favoritePage.dart';
import 'package:treva_shop_flutter/UI/LoginOrSignup/login&signup.dart';
import 'package:treva_shop_flutter/UI/help/colors.dart';
import 'package:treva_shop_flutter/bloc/authentication.dart';

class profil extends StatefulWidget {
  @override
  _profilState createState() => _profilState();
}

class _profilState extends State<profil> {
  String _tokenString;
  bool isLoggedin = false;
  @override
  void initState() {
    isLogin();
    authBloc.restoreSession();
    super.initState();
  }

  isLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _tokenString = prefs.get("token");
    print("i have return token and he is $_tokenString");
    if (_tokenString != null) {
      setState(() {
        isLoggedin = true;
      });
    } else {
      setState(() {
        isLoggedin = false;
      });
    }
    print("yes it's ok");
  }

  _navigate() {
    Navigator.of(context).pushReplacement(
        PageRouteBuilder(pageBuilder: (_, __, ___) => signup()));
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    /// Declare MediaQueryData
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return !isLoggedin
        ? signup()
        : Scaffold(
            backgroundColor: Colors.white,

            /// Use Stack to costume a appbar
            body: Container(
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: mediaQueryData.padding.top + 5.5),
                      child: Column(
                        children: <Widget>[
                          setting(
                            head: "",
                            sub1: "My Profile",
                            sub2: "Contact Us",
                            sub3: "Invite Friends To Install Table.ha",
                            sub4: "Log Out",
                          ),
//                    InkWell(
//                      onTap: () {
//                        Navigator.of(context).push(PageRouteBuilder(
//                            pageBuilder: (_, __, ___) => signup()));
//                      },
//                      child: Text("Signup"),
//                    )
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
              /// if user click shape white in appbar navigate to search layout
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => searchAppbar(),

                        /// transtation duration in animation
                        transitionDuration: Duration(milliseconds: 750),

                        /// animation route to search layout
                        transitionsBuilder:
                            (_, Animation<double> animation, __, Widget child) {
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
                        transitionsBuilder:
                            (_, Animation<double> animation, __, Widget child) {
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
              'Settings',
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
