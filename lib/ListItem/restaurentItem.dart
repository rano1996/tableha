import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/myMap.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/restaurentDeails.dart';
import 'package:treva_shop_flutter/UI/help/colors.dart';
import 'package:treva_shop_flutter/models/restaurentItem.dart';

class RestaurentItem extends StatefulWidget {
  final resItem item;

  RestaurentItem(this.item);

  @override
  _RestaurentItemState createState() => _RestaurentItemState();
}

class _RestaurentItemState extends State<RestaurentItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 10, right: 10, top: 5),
      child: Column(
        children: <Widget>[
          //item
          Row(
            children: <Widget>[
              //logo
              Container(
                padding: EdgeInsets.only(left: 5),
                width: (MediaQuery.of(context).size.width * (1 / 3)) - 10,
                child: Stack(
//              alignment: AlignmentDirectional(-3.0, -3.0),
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(widget.item.logo),
                        ),
                      ),
                    ),
                    widget.item.isRes
                        ? Container(
                            child: Image.asset(
                              "assets/tableha/icon/Res_card2.png",
                              fit: BoxFit.fill,
                              width: 50,
                              height: 50,
                            ),
                          )
                        : Image.asset(
                            "assets/tableha/icon/Caffe_cards1.png",
                            width: 50,
                            height: 50,
                          ),
//                CircleAvatar(
////                  radius: 8.6,
////                  backgroundColor: Colors.white,
//                  child: widget.item.isRes
//                      ? Image.asset(
//                          "assets/tableha/icon/Res_card2.png",
//                          fit: BoxFit.fill,
//                        )
//                      : Image.asset("assets/tableha/icon/Caffe_cards1.png"),
//                ),
                  ],
                ),
              ),

              //Rest of the Row
              Container(
                width: (MediaQuery.of(context).size.width * (2 / 3)) - 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //res name
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  RestaurentDetails(widget.item),

                              /// transtation duration in animation
                              transitionDuration: Duration(milliseconds: 750),

                              /// animation route to search layout
                              transitionsBuilder: (_,
                                  Animation<double> animation,
                                  __,
                                  Widget child) {
                                return Opacity(
                                  opacity: animation.value,
                                  child: child,
                                );
                              }),
                        );
                      },
                      child: Text(
                        widget.item.resName,
                        style: TextStyle(
                            color: hexToColor("#333333"),
                            fontFamily: "CaviarDreams",
                            fontWeight: FontWeight.w900,
                            fontSize: 17),
                      ),
                    ),

                    SizedBox(
                      height: 3,
                    ),
                    //address
                    Text(
                      widget.item.address,
                      style: TextStyle(
                          color: hexToColor("#757575"),
                          fontFamily: "CaviarDreams",
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 3,
                    ),

                    //peroid of opening
                    Row(
                      children: <Widget>[
                        // open or close
                        widget.item.isOpen
                            ? Text(
                                "Open Now",
                                style: TextStyle(
                                    color: hexToColor("#338638"),
                                    fontFamily: "CaviarDreams",
                                    fontSize: 16),
                              )
                            : Text(
                                "Close Now",
                                style: TextStyle(
                                    color: hexToColor("#FF8800"),
                                    fontFamily: "CaviarDreams",
                                    fontSize: 16),
                              ),
                        SizedBox(
                          width: 2,
                        ),
                        //open time
                        Text(
                          widget.item.openTime,
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontFamily: "CaviarDreams",
                              fontSize: 13),
                        ),

                        //space

                        //open time
                        Text(
                          " - ",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontFamily: "CaviarDreams",
                              fontSize: 13),
                        ),
                        //open time
                        Text(
                          widget.item.closeTime,
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontFamily: "CaviarDreams",
                              fontSize: 13),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    // distance location fave rate
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // distance + rate
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              //distance
                              Text(
                                widget.item.distance,
                                style: TextStyle(
                                    color: hexToColor("#757575"),
                                    fontFamily: "CaviarDreams",
                                    fontSize: 16),
                              ),

                              // starts
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(3, (int index) {
//                                  return Icon(
//                                    index < widget.item.rate
//                                        ? Icons.star
//                                        : Icons.star_border,
//                                    color: hexToColor("#FFC646"),
//                                    size: 17,
//                                  );
                                  return InkWell(
                                    onTap: () {
                                      print('$index');
                                      setState(() {
                                        print('before ${widget.item.rate}');
                                        if (index + 1 > widget.item.rate) {
                                          int newValue =
                                              (index + 1) - widget.item.rate;
                                          int indexInArr =
                                              res.indexOf(widget.item);
                                          res[indexInArr].rate =
                                              widget.item.rate + newValue;
                                          print('after ${widget.item.rate}');
                                          print('newValue ${newValue}');
                                        } else if (index + 1 <
                                            widget.item.rate) {
                                          int newValue =
                                              widget.item.rate - (index);
                                          int indexInArr =
                                              res.indexOf(widget.item);
                                          res[indexInArr].rate =
                                              widget.item.rate - newValue;
                                          print('after ${widget.item.rate}');
                                          print('newValue ${newValue}');
                                        }
                                      });
                                    },
                                    child: Image.asset(
                                      index < widget.item.rate
                                          ? "assets/tableha/icon/Fill rate.png"
                                          : "assets/tableha/icon/outline rate.png",
                                      width: 20,
                                      height: 20,
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            //favorite
                            Container(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    print(
                                        "before favorite ${widget.item.isFav}");
                                    widget.item.isFav = !widget.item.isFav;
                                    int index = res.indexOf(widget.item);
                                    res[index].isFav = widget.item.isFav;
                                    print(
                                        "after favorite ${widget.item.isFav}");
                                  });
                                },
                                child: widget.item.isFav
                                    ? Image.asset(
                                        "assets/tableha/icon/Like.png",
                                        width: 25,
                                        height: 25,
                                      )
                                    : Image.asset(
                                        "assets/tableha/icon/D like.png",
                                        width: 25,
                                        height: 25,
                                      ),
                              ),
                            ),

                            SizedBox(
                              width: 7,
                            ),

                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(PageRouteBuilder(
                                    pageBuilder: (_, __, ___) => myMap(
                                        widget.item.latitude,
                                        widget.item.longitude)));
                              },
                              child: Image.asset(
                                "assets/tableha/icon/Our location.png",
                                width: 25,
                                height: 25,
                              ),
                            ),
                          ],
                        ),
                        //fav locationm
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          // divider
          Divider(),
        ],
      ),
    );
  }
}
