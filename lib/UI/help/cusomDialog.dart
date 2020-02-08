import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/UI/help/colors.dart';

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;
  final Widget body;

  CustomDialog({
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
                Navigator.of(context).pop(); // To close the dialog
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

//
//Text(
//description,
//textAlign: TextAlign.center,
//style: TextStyle(
//fontFamily: 'CaviarDreams',
//fontSize: 16.0,
//),
//),
