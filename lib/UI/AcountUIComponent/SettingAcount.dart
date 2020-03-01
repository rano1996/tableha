import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:treva_shop_flutter/UI/AcountUIComponent/myprofile.dart';
import 'package:treva_shop_flutter/UI/help/colors.dart';
import 'package:treva_shop_flutter/bloc/logout.dart';
import 'package:url_launcher/url_launcher.dart';

class settingAcount extends StatefulWidget {
  @override
  _settingAcountState createState() => _settingAcountState();
}

class _settingAcountState extends State<settingAcount> {
  static var _txtCustomHead = TextStyle(
    color: Colors.black54,
    fontSize: 17.0,
    fontWeight: FontWeight.w600,
    fontFamily: "Gotik",
  );

  static var _txtCustomSub = TextStyle(
    color: Colors.black38,
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
    fontFamily: "Gotik",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          "Setting Acount",
//          style: TextStyle(
//              fontWeight: FontWeight.w700,
//              fontSize: 18.0,
//              color: Colors.black54,
//              fontFamily: "Gotik"),
//        ),
//        centerTitle: true,
//        iconTheme: IconThemeData(color: Color(0xFF6991C7)),
//        elevation: 0.0,
//      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              setting(
                head: "Account",
                sub1: "Address",
                sub2: "Telephone",
                sub3: "Email",
              ),
              setting(
                head: "Setting",
                sub1: "Order Notifications",
                sub2: "Discount Notifications",
                sub3: "Credit Card",
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                  height: 50.0,
                  width: 1000.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 13.0, left: 20.0, bottom: 15.0),
                    child: Text(
                      "Logout",
                      style: _txtCustomHead,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class setting extends StatelessWidget {
  static var _txtCustomHead = TextStyle(
    color: Colors.black54,
    fontSize: 17.0,
    fontWeight: FontWeight.w600,
    fontFamily: "Gotik",
  );

  static var _txtCustomSub = TextStyle(
    color: Colors.black54,
    fontSize: 19.0,
    fontWeight: FontWeight.w600,
    fontFamily: "CaviarDreams",
  );

  String head, sub1, sub2, sub3, sub4;

  setting({this.head, this.sub1, this.sub2, this.sub3, this.sub4});

  @override
  Widget build(BuildContext context) {
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
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0, top: 15.0),
                child: Text(
                  head,
                  style: _txtCustomHead,
                ),
              ),

              //open profile

              InkWell(
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (_, __, ___) => myProfile()));
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          sub1,
                          style: _txtCustomSub,
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black38,
                        )
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
                onTap: () async {
                  const url = 'mailto:info@tableha.com';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          sub2,
                          style: _txtCustomSub,
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black38,
                        )
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
              //share
              InkWell(
                onTap: () {
                  Share.share(
                      "the data to share it with others https://stackoverflow.com");
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          sub3,
                          style: _txtCustomSub,
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black38,
                        )
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
              //logout
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => CustomDialogLogout(
                      title: "Log Out!",
                      description: "Are you sure you want to Log Out",
                      buttonText: "Yes",
                    ),
                  );
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          sub4,
                          style: _txtCustomSub,
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black38,
                        )
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
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDialogLogout extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;
  final Widget body;
  LogoutBloc bloc = LogoutBloc();

  CustomDialogLogout({
    @required this.title,
    this.description,
    this.buttonText,
    this.image,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 10, bottom: 10, right: 10
//        top: Consts.avatarRadius + Consts.padding,
//        bottom: Consts.padding,
//        left: Consts.padding,
//        right: Consts.padding,
          ),
      margin: EdgeInsets.only(top: 10),
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center, // To make the card compact
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: Colors.grey[600],
                fontFamily: 'CaviarDreams',
                fontWeight: FontWeight.w900,
                fontSize: 20),
          ),
          SizedBox(height: 16.0),
          //
          description != null
              ? Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'CaviarDreams',
                    fontSize: 16.0,
                  ),
                )
              : Container(),

          ///
          ///
          body != null
              ? Container(
                  alignment: Alignment.center,
                  child: body,
                )
              : Container(),

          ///
          ///
          SizedBox(height: 16.0),
          Align(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              color: hexToColor("#A8CF39"),
              onPressed: () {
                bloc.logoutUser(context); // To close the dialog
              },
              child: Text(buttonText,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'CaviarDreams',
                      fontSize: 17)),
            ),
          ),
        ],
      ),
    );
  }
}
