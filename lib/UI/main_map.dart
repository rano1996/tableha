import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/Search.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/favoritePage.dart';
import 'package:treva_shop_flutter/UI/help/colors.dart';

class MainMap extends StatefulWidget {
  @override
  _MainMapState createState() => _MainMapState();
}

class _MainMapState extends State<MainMap> {
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
            Container(
              height: MediaQuery.of(context).size.height - 60,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: mediaQueryData.padding.top + 59.0),
              child: FlutterMap(
                options: new MapOptions(
                  center: LatLng(51.5, -0.09),
                  zoom: 13.0,
                ),
                layers: [
                  new TileLayerOptions(
                    urlTemplate: "https://api.tiles.mapbox.com/v4/"
                        "{id}/{z}/{x}/{y}@2x.png?access_token=sk.eyJ1IjoibGFtYXJhbm8iLCJhIjoiY2s3OGU5eXQ0MGdhajNnbzIyZmRqajYxbCJ9.rI8mIArWEPT9nwHNdmo4Ug",
                    additionalOptions: {
                      'accessToken':
                          'sk.eyJ1IjoibGFtYXJhbm8iLCJhIjoiY2s3OGU5eXQ0MGdhajNnbzIyZmRqajYxbCJ9.rI8mIArWEPT9nwHNdmo4Ug',
                      'id': 'mapbox.streets',
                    },
                  ),
                  new MarkerLayerOptions(
                    markers: [
                      new Marker(
                        width: 80.0,
                        height: 80.0,
                        point: new LatLng(51.5, -0.09),
                        builder: (ctx) => new Container(
                          child: new FlutterLogo(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AppBar(context, statusBarHeight),
          ],
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
                'Map',
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
