import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:treva_shop_flutter/ListItem/BrandDataList.dart';
import 'package:treva_shop_flutter/UI/BrandUIComponent/BrandDetail.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/Search.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/favoritePage.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/myMap.dart';
import 'package:treva_shop_flutter/UI/help/colors.dart';
import 'package:treva_shop_flutter/models/restaurentItem.dart';

class brand extends StatefulWidget {
  @override
  _brandState createState() => _brandState();
}

const double CAMERA_ZOOM = 15;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;
LatLng SOURCE_LOCATION = LatLng(33.513833, 36.276526);

class _brandState extends State<brand> {
  Completer<GoogleMapController> _controller = Completer();
  // this set will hold my markers
  Set<Marker> _markers = {};
  // this will hold the generated polylines
  Set<Polyline> _polylines = {};
  // this will hold each polyline coordinate as Lat and Lng pairs
  List<LatLng> polylineCoordinates = [];
  // this is the key object - the PolylinePoints
  // which generates every polyline between start and finish
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPIKey = "AIzaSyCnVpXn6mj7hkVtJzZObJA2XHx-iGnBpaY";
  // for my custom icons
  BitmapDescriptor sourceIcon;
  Position _currentPosition;
  BitmapDescriptor destinationIcon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        print("i get you loaction $_currentPosition");
        SOURCE_LOCATION =
            LatLng(_currentPosition.latitude, _currentPosition.longitude);
        print("so your source is $SOURCE_LOCATION");
      });
    }).catchError((e) {
      print(e);
    });
//    setMapPins();
  }

  @override
  Widget build(BuildContext context) {
    /// Component appbar

    final double statusBarHeight = MediaQuery.of(context).padding.top;

    /// Declare MediaQueryData
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    CameraPosition initialLocation = CameraPosition(
      zoom: CAMERA_ZOOM,
      bearing: CAMERA_BEARING,
      tilt: CAMERA_TILT,
      target: SOURCE_LOCATION,
    );
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
              child: GoogleMap(
                  myLocationEnabled: true,
                  compassEnabled: true,
                  tiltGesturesEnabled: false,
                  markers: _markers,
                  polylines: _polylines,
                  mapType: MapType.satellite,
                  initialCameraPosition: initialLocation,
                  onMapCreated: onMapCreated),
            ),
            AppBar(context, statusBarHeight),
          ],
        ),
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(Utils.mapStyles);
    _controller.complete(controller);
    setMapPins();
//    setPolylines();
  }

  void setMapPins() {
    print("toto0 is $makers");
    var markers = (data as List)
        .map((i) =>
            LatLng(double.parse(i["latitude"]), double.parse(i["longitude"])))
        .toList();
    print("markers is $markers");

    setState(() {
      // source pin
      markers.forEach((i) {
        print("your maker position ist $i");
        _markers.add(Marker(
            markerId: MarkerId('sourcePin${i}'),
            position: i,
            icon: sourceIcon));
        print("your full makers is $_markers");
      });
    });
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

/// Constructor for itemCard for List Menu
class itemCard extends StatelessWidget {
  /// Declaration and Get data from BrandDataList.dart
  final Brand brand;
  itemCard(this.brand);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
                pageBuilder: (_, __, ___) => new brandDetail(brand),
                transitionDuration: Duration(milliseconds: 600),
                transitionsBuilder:
                    (_, Animation<double> animation, __, Widget child) {
                  return Opacity(
                    opacity: animation.value,
                    child: child,
                  );
                }),
          );
        },
        child: Container(
          height: 130.0,
          width: 400.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: Hero(
            tag: 'hero-tag-${brand.id}',
            child: Material(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  image: DecorationImage(
                      image: AssetImage(brand.img), fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFABABAB).withOpacity(0.3),
                      blurRadius: 1.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Colors.black12.withOpacity(0.1),
                  ),
                  child: Center(
                    child: Text(
                      brand.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Berlin",
                        fontSize: 35.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
