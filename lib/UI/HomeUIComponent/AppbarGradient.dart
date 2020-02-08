import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/Search.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/favoritePage.dart';
import 'package:treva_shop_flutter/UI/help/colors.dart';

class AppbarGradient extends StatefulWidget {
  @override
  _AppbarGradientState createState() => _AppbarGradientState();
}

class _AppbarGradientState extends State<AppbarGradient> {
  String CountNotice = "4";

  /// Build Appbar in layout home
  @override
  Widget build(BuildContext context) {
    /// Create responsive height and padding
    final MediaQueryData media = MediaQuery.of(context);
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    /// Create component in appbar
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
                'List',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'CaviarDreams',
                    fontWeight: FontWeight.w900,
                    fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
