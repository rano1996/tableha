import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/ListItem/restaurentItem.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/Search.dart';
import 'package:treva_shop_flutter/UI/help/colors.dart';
import 'package:treva_shop_flutter/models/restaurentItem.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    /// Create responsive height and padding
    final MediaQueryData media = MediaQuery.of(context);
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              appBar(media, statusBarHeight),
              Container(
                height: media.size.height,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    List temp = res.where((i) => i.isFav).toList();
                    return RestaurentItem(temp[index]);
                  },
                  itemCount: res.where((i) => i.isFav).toList().length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar(MediaQueryData media, double val) {
    return Container(
      padding: EdgeInsets.only(top: val, left: 25, right: 25, bottom: 3),
      height: 58.0 + val,
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
                // back button

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
                        left: media.padding.left + 15,
                        right: media.padding.left + 26),
                    child: Image.asset(
                      "assets/tableha/Search_app.png",
                      height: media.devicePixelRatio + 28.0,
                    ),
                  ),
                ),

                /// Icon chat (if user click navigate to Favorite layout)
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
                'Favorites',
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
