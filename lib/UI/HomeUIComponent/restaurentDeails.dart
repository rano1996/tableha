import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/Search.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/favoritePage.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/myMap.dart';
import 'package:treva_shop_flutter/UI/help/colors.dart';
import 'package:treva_shop_flutter/UI/help/cusomDialog.dart';
import 'package:treva_shop_flutter/models/restaurentItem.dart';
import 'package:url_launcher/url_launcher.dart';

class RestaurentDetails extends StatefulWidget {
  final resItem item;

  RestaurentDetails(this.item);

  @override
  _RestaurentDetailsState createState() => _RestaurentDetailsState();
}

class _RestaurentDetailsState extends State<RestaurentDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// Create responsive height and padding
    final MediaQueryData media = MediaQuery.of(context);
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Container(
//            color: Colors.white,
            child: Column(
              children: <Widget>[
                // app bar
                appBar(media, statusBarHeight),

                //logo
                ShowLogo(),

                // social media bar
                SocialMedia(),

                //news
                buildNews("News", widget.item.offer),

                //images
                buildImageRow(),

                //about
                buildNews("About Us", widget.item.about),

                //contact Info
                buildContact(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImageRow() {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          widget.item.moreImg != null && widget.item.moreImg[0] != null
              ? ClipRRect(
                  borderRadius: new BorderRadius.circular(25.0),
                  child: Image.asset(
                    widget.item.moreImg[0],
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                )
              : Container(),
          widget.item.moreImg != null && widget.item.moreImg[1] != null
              ? ClipRRect(
                  borderRadius: new BorderRadius.circular(25.0),
                  child: Image.asset(
                    widget.item.moreImg[1],
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                )
              : Container(),
          widget.item.moreImg != null && widget.item.moreImg.length >= 3
              ? ClipRRect(
                  borderRadius: new BorderRadius.circular(25.0),
                  child: Image.asset(
                    widget.item.moreImg[2],
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  Widget contactitem(String image, String value) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Image.asset(
            image,
            width: 20,
            height: 20,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            value,
            style: TextStyle(
                color: Colors.grey[500],
                fontFamily: 'CaviarDreams',
                fontWeight: FontWeight.w600,
                fontSize: 17),
          )
        ],
      ),
    );
  }

  Widget buildContact() {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ///title
          Text(
            "CONTACT INFO",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'CaviarDreams',
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
          ),

          //items
          contactitem(
              'assets/tableha/icon/Call contact info.png', widget.item.phone),
          contactitem('assets/tableha/icon/Facebook.png', widget.item.fbAdress),
          contactitem(
              'assets/tableha/icon/Instagram.png', widget.item.instAdress),
          contactitem(
              'assets/tableha/icon/Our location.png', widget.item.address),

          ///text
        ],
      ),
    );
  }

  Widget buildNews(String Label, String Content) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ///title
          Text(
            Label,
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'CaviarDreams',
                fontWeight: FontWeight.w600,
                fontSize: 20),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
          ),

          ///text
          Text(
            Content,
            style: TextStyle(
                color: Colors.grey[500],
                fontFamily: 'CaviarDreams',
                fontWeight: FontWeight.w600,
                fontSize: 17),
          ),
        ],
      ),
    );
  }

  Widget ShowLogo() {
    return Container(
        height: 270,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
//        padding: EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            //logo
            Image.asset(
              widget.item.logo,
              fit: BoxFit.cover,
            ),
            //top bar
            Container(
              color: Colors.black54,
              padding:
                  EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //back button
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 17.0,
                    ),
                  ),

                  //res Name
                  Text(
                    widget.item.resName,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'CaviarDreams',
                        fontWeight: FontWeight.w900,
                        fontSize: 25),
                  ),

                  //stars
                  threeStars()
                ],
              ),
            ),
          ],
        ));
  }

  Widget threeStars() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
                int newValue = (index + 1) - widget.item.rate;
                int indexInArr = res.indexOf(widget.item);
                res[indexInArr].rate = widget.item.rate + newValue;
                print('after ${widget.item.rate}');
                print('newValue ${newValue}');
              } else if (index + 1 < widget.item.rate) {
                int newValue = widget.item.rate - (index);
                int indexInArr = res.indexOf(widget.item);
                res[indexInArr].rate = widget.item.rate - newValue;
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
    );
  }

  Widget IconImage(String Link, Function action) {
    return Container(
      child: InkWell(
        onTap: action,
        child: Container(
          width: 30,
          height: 30,
          child: Image.asset(Link),
        ),
      ),
    );
  }

  Widget SocialMedia() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 5),
      child: Column(
        children: <Widget>[
          Divider(),
          // frist row
          Container(
            padding: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //share
                IconImage("assets/tableha/icon/Share.png", () {
                  Share.share(
                      "the data to share it with others https://stackoverflow.com");
                }),
                //
                //rate
                IconImage("assets/tableha/icon/Rate us.png", () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => CustomDialog(
                      title: "Rate us!",
                      body: threeStars(),
                      buttonText: "OK",
                    ),
                  );
                }),

                //favorite
                widget.item.isFav
                    ? IconImage("assets/tableha/icon/Like.png", () {
                        setState(() {
                          print("before favorite ${widget.item.isFav}");
                          widget.item.isFav = !widget.item.isFav;
                          int index = res.indexOf(widget.item);
                          res[index].isFav = widget.item.isFav;
                          print("after favorite ${widget.item.isFav}");
                        });
                      })
                    : IconImage("assets/tableha/icon/D like.png", () {
                        setState(() {
                          print("before favorite ${widget.item.isFav}");
                          widget.item.isFav = !widget.item.isFav;
                          int index = res.indexOf(widget.item);
                          res[index].isFav = widget.item.isFav;
                          print("after favorite ${widget.item.isFav}");
                        });
                      }),

                //phone
                IconImage("assets/tableha/icon/Call contact info.png", () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => call());
                }),

                // location
                IconImage("assets/tableha/icon/Our location.png", () {
                  Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (_, __, ___) =>
                          myMap(widget.item.latitude, widget.item.longitude)));
                }),
              ],
            ),
          ),

          //divider
          Divider(),
        ],
      ),
    );
  }

  Widget call() {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.only(top: 30, left: 15, bottom: 30, right: 15
//        top: Consts.avatarRadius + Consts.padding,
//        bottom: Consts.padding,
//        left: Consts.padding,
//        right: Consts.padding,
            ),
//        margin: EdgeInsets.only(top: 10),
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
        child: InkWell(
          onTap: () async {
            if (await canLaunch("tel://${widget.item.phone}")) {
              await launch("tel://${widget.item.phone}");
            } else {
              throw 'Could not launch';
            }
//            UrlLauncher.launch("tel://${widget.item.phone}");
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment:
                MainAxisAlignment.center, // To make the card compact
            children: <Widget>[
              Image.asset(
                "assets/tableha/icon/Call contact info.png",
                width: 25,
                height: 25,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                "Call ${widget.item.phone}",
                style: TextStyle(
                    color: Colors.grey[600],
                    fontFamily: 'CaviarDreams',
                    fontWeight: FontWeight.w900,
                    fontSize: 25),
              ),
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
                'Details',
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
