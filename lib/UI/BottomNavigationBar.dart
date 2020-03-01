import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/UI/AcountUIComponent/Profile.dart';
import 'package:treva_shop_flutter/UI/BrandUIComponent/BrandLayout.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/Home.dart';
import 'package:treva_shop_flutter/UI/help/colors.dart';

class bottomNavigationBar extends StatefulWidget {
  @override
  _bottomNavigationBarState createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  int currentIndex = 1;

  /// Set a type current number a layout class
  Widget callPage(int current) {
    switch (current) {
      case 0:
        return new Menu();
      case 1:
        return new brand();
//        return new MainMap();
      case 2:
        return new profil();
        break;
      default:
        return brand();
    }
  }

  /// Build BottomNavigationBar Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: callPage(currentIndex),
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
              textTheme: Theme.of(context).textTheme.copyWith(
                  caption: TextStyle(color: Colors.black26.withOpacity(0.15)))),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            fixedColor: hexToColor("#A8CF39"),
            onTap: (value) {
              currentIndex = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  size: 35.0,
                ),
                title: Text(
                  "",
//                    style: TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.location_on,
                  size: 35.0,
                ),
                title: Text(
                  "Brand",
                  style: TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 35.0,
                ),
                title: Text(
                  "Acount",
                  style: TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
                ),
              ),
            ],
          )),
    );
  }
}
