import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/ListItem/restaurentItem.dart';
import 'package:treva_shop_flutter/UI/help/colors.dart';
import 'package:treva_shop_flutter/models/restaurentItem.dart';

class searchAppbar extends StatefulWidget {
  @override
  _searchAppbarState createState() => _searchAppbarState();
}

class _searchAppbarState extends State<searchAppbar>
    with TickerProviderStateMixin {
  TabController _controller;
  TextEditingController controllerSearch = new TextEditingController();
  String filter;

  @override
  initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
    _controller.addListener(_handleTabSelection);
    controllerSearch.addListener(() {
      setState(() {
        filter = controllerSearch.text;
      });
    });
  }

  @override
  void dispose() {
    controllerSearch.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  /// Item TextFromField Search

  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
              height: 1000,
//            padding: EdgeInsets.only(top: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //create header bar in here
                  headerBuild(statusBarHeight),
                  buildBody(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBody() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: new TabBar(
              indicatorColor: hexToColor("#A8CF39"),
              labelStyle: TextStyle(color: Colors.blue),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              controller: _controller,
              tabs: [
                new Tab(
                  child: Text(
                    'All',
                    style: TextStyle(
                      color: _controller.index == 0
                          ? Colors.black
                          : Colors.grey[500],
                      fontFamily: "CaviarDreams",
                      fontSize: 18,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Caffe',
                    style: TextStyle(
                      color: _controller.index == 1
                          ? Colors.black
                          : Colors.grey[500],
                      fontFamily: "CaviarDreams",
                      fontSize: 18,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Restaurent',
                    style: TextStyle(
                      color: _controller.index == 2
                          ? Colors.black
                          : Colors.grey[500],
                      fontFamily: "CaviarDreams",
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 700,
            child: TabBarView(
              controller: _controller,
              children: <Widget>[
                //all
                Container(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return filter == null || filter == ""
                          ? RestaurentItem(res[index])
                          : res[index].resName.toLowerCase().contains(filter)
                              ? RestaurentItem(res[index])
                              : Container();
                    },
                    itemCount: res.length,
                  ),
                ),

                Container(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      List caffe = res.where((i) => !i.isRes).toList();
                      return filter == null || filter == ""
                          ? RestaurentItem(caffe[index])
                          : caffe[index].resName.toLowerCase().contains(filter)
                              ? RestaurentItem(caffe[index])
                              : Container();
                    },
                    itemCount: res.where((i) => !i.isRes).toList().length,
                  ),
                ),

                Container(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      List Restaurent = res.where((i) => i.isRes).toList();
                      return filter == null || filter == ""
                          ? RestaurentItem(Restaurent[index])
                          : Restaurent[index]
                                  .resName
                                  .toLowerCase()
                                  .contains(filter)
                              ? RestaurentItem(Restaurent[index])
                              : Container();
                    },
                    itemCount: res.where((i) => i.isRes).toList().length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //header build
  Widget headerBuild(double val) {
    return Container(
      padding: EdgeInsets.only(top: val, left: 25, right: 25, bottom: 3),
      height: 75.0 + val,
      decoration: BoxDecoration(
        color: hexToColor('#A8CF39'),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
//                  padding: EdgeInsets.all(5),
                  height: 45,
                  decoration: BoxDecoration(
                    color: hexToColor("#b9d860"),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Row(
//                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Image.asset(
                          "assets/tableha/icon/search_box.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 180,
//                        color: Colors.blue,
//                        margin: EdgeInsets.only(top: 15),
                        child: TextFormField(
                          controller: controllerSearch,
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
//                          textAlign: TextAlign,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search",
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: 'CaviarDreams',
                                fontWeight: FontWeight.w600,
                                fontSize: 19),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// Icon notification (if user click navigate to notification layout)
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              child: Text(
                'Cancel',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'CaviarDreams',
                    fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Popular Keyword Item class
class KeywordItem extends StatelessWidget {
  @override
  String title, title2;

  KeywordItem({this.title, this.title2});

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 3.0),
          child: Container(
            height: 29.5,
            width: 90.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4.5,
                  spreadRadius: 1.0,
                )
              ],
            ),
            child: Center(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black54, fontFamily: "Sans"),
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 15.0)),
        Container(
          height: 29.5,
          width: 90.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4.5,
                spreadRadius: 1.0,
              )
            ],
          ),
          child: Center(
            child: Text(
              title2,
              style: TextStyle(
                color: Colors.black54,
                fontFamily: "Sans",
              ),
            ),
          ),
        ),
      ],
    );
  }
}

///Favorite Item Card
class FavoriteItem extends StatelessWidget {
  String image, Rating, Salary, title, sale;

  FavoriteItem({this.image, this.Rating, this.Salary, this.title, this.sale});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 2.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF656565).withOpacity(0.15),
                blurRadius: 4.0,
                spreadRadius: 1.0,
//           offset: Offset(4.0, 10.0)
              )
            ]),
        child: Wrap(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 120.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7.0),
                          topRight: Radius.circular(7.0)),
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.cover)),
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    title,
                    style: TextStyle(
                        letterSpacing: 0.5,
                        color: Colors.black54,
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w500,
                        fontSize: 13.0),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 1.0)),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    Salary,
                    style: TextStyle(
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            Rating,
                            style: TextStyle(
                                fontFamily: "Sans",
                                color: Colors.black26,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 14.0,
                          )
                        ],
                      ),
                      Text(
                        sale,
                        style: TextStyle(
                            fontFamily: "Sans",
                            color: Colors.black26,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
