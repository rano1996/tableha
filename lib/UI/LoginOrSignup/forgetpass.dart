import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            //logo
            Container(
              padding: EdgeInsets.fromLTRB(10, 100, 10, 140),
              child: Container(
                child: Image.asset(
                  'assets/tableha/Logo.png',
                  // height: 25.0,
                  width: 200,
                  //  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            //email
            Container(
              padding: EdgeInsets.all(40),
              child: Form(
                child: Container(
                  child: TextFormField(
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
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 100, 20, 20),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFA8CF39),
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(100)),
                child: FlatButton(
                  padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                  onPressed: () {},
                  child: Text(
                    'Reset Password',
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
          ],
          //logo
        ),
      ),
    );
  }
}
