import 'package:flutter/material.dart';

class Error_handle extends StatelessWidget {
  final String error;

  Error_handle(this.error);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Wrap(
        spacing: 20.0,
        alignment: WrapAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Error occured: $error"),
            ],
          ),
        ],
      ),
    );
  }
}
