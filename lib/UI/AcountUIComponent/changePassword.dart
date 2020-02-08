import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/Search.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/favoritePage.dart';
import 'package:treva_shop_flutter/UI/help/colors.dart';
import 'package:treva_shop_flutter/UI/help/cusomDialog.dart';
import 'package:treva_shop_flutter/models/user.dart';

class changePassword extends StatefulWidget {
  @override
  _changePasswordState createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> {
  final GlobalKey<FormState> _keyForm = GlobalKey();

  TextEditingController cuPass = TextEditingController();
  TextEditingController newPass = TextEditingController();
  TextEditingController rePass = TextEditingController();

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
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding:
                      EdgeInsets.only(top: mediaQueryData.padding.top + 65.5),
                  child: Form(
                    key: _keyForm,
                    child: Column(
                      children: <Widget>[
                        // Add TextFormFields and RaisedButton here.
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Current Password',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 19.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: "CaviarDreams",
                              ),
                            ),
                            controller: cuPass,
                            validator: (String value) {
                              if (value.trim().isEmpty) {
                                return 'Password is required';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'New Password',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 19.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: "CaviarDreams",
                              ),
                            ),
                            controller: newPass,
                            validator: (String value) {
                              if (value.trim().isEmpty) {
                                return 'Password is required';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Re-Password',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 19.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: "CaviarDreams",
                              ),
                            ),
                            controller: rePass,
                            validator: (String value) {
                              if (value.trim().isEmpty) {
                                return 'Password is required';
                              }
                              return null;
                            },
                          ),
                        ),

                        //save button
                        Expanded(
//                          alignment: Alignment.bottomCenter,
//                          color: Colors.red,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            padding: EdgeInsets.only(bottom: 25),
                            child: FlatButton(
                              padding: EdgeInsets.symmetric(horizontal: 80),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              color: hexToColor("#A8CF39"),
                              onPressed: () {
                                _submitForm(); // To close the dialog
                              },
                              child: Text("Save",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'CaviarDreams',
                                      fontSize: 17)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
//                      settingNew(context),
                ),
              ),
              AppBar(context, statusBarHeight),
            ],
          ),
        ),
      ),
    );
    ;
  }

  _submitForm() {
    if (user.password != cuPass.text) {
      showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialog(
          title: "Wrong Password!",
          description: "Please enter a valid password",
          buttonText: "OK",
        ),
      );
    }
    if (newPass.text != rePass.text) {
      showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialog(
          title: "Password MisMatch!",
          description: "Please enter a matched password",
          buttonText: "OK",
        ),
      );
    }
    if (_keyForm.currentState.validate()) {
      // If the form is valid, display a Snackbar.
//      user.password = newPass.text;
//      showDialog(
//        context: context,
//        builder: (BuildContext context) => CustomDialog(
//          title: "Success!",
//          description: "Your password has been changed Successfully",
//          buttonText: "OK",
//        ),
//      );
      Navigator.of(context).pop(true);
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
