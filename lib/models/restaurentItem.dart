import 'package:google_maps_flutter/google_maps_flutter.dart';

class resItem {
  int id;
  String logo;
  bool isRes;
  bool isOpen;
  String resName;
  String address;
  String distance;
  bool isFav;
  int rate;
  String openTime;
  String closeTime;
  String offer;
  String about;
  List<String> moreImg;
  String phone;
  String fbAdress;
  String instAdress;
  String longitude;
  String latitude;

  resItem(
      {this.id,
      this.address,
      this.closeTime,
      this.distance,
      this.isFav,
      this.isOpen,
      this.isRes,
      this.logo,
      this.openTime,
      this.rate,
      this.fbAdress,
      this.about,
      this.resName,
      this.instAdress,
      this.moreImg,
      this.offer,
      this.phone,
      this.longitude,
      this.latitude});

  factory resItem.fromJson(Map<String, dynamic> json) {
    return resItem(
        address: json['address'],
        closeTime: json['closeTime'],
        distance: json['distance'],
        id: json['id'],
        isFav: json['isFav'],
        isOpen: json['isOpen'],
        isRes: json['isRes'],
        logo: json['logo'],
        openTime: json['openTime'],
        rate: json['rate'],
        resName: json['resName'],
        about: json['about'],
        fbAdress: json['fbAdress'],
        instAdress: json['instAdress'],
        offer: json['offer'],
        phone: json['phone'],
        moreImg: json['moreImg'],
        longitude: json['longitude'],
        latitude: json['latitude']);
  }
}

List<Map<String, dynamic>> data = [
  {
    "id": 1,
    "logo": "assets/tableha/list/1.jpg",
    "isRes": false,
    "isOpen": true,
    "resName": "Starbucks Caffe",
    "address": "Malki - Zanubia Street",
    "distance": "100 Km From You",
    "isFav": true,
    "rate": 2,
    "openTime": "9:00 AM",
    "closeTime": "2:30 AM",
    "about":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    "offer":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "fbAdress": "FaceBook.Com",
    "instAdress": "Instagam.insta",
    "moreImg": [
      "assets/tableha/list/1-1.jpg",
      "assets/tableha/list/1-2.jpg",
      "assets/tableha/list/1-3.jpg"
    ],
    "phone": "0996 834 696",
    "latitude": "33.513833",
    "longitude": "36.276526"
  },
  {
    "id": 2,
    "logo": "assets/tableha/list/2.jpg",
    "isRes": true,
    "isOpen": false,
    "resName": "MacDonald's Food",
    "address": "Abo Remaneh",
    "distance": "200 Km From You",
    "isFav": false,
    "rate": 1,
    "openTime": "9:00 AM",
    "closeTime": "2:30 AM",
    "about":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    "offer":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "fbAdress": "FaceBook.Com",
    "instAdress": "Instagam.insta",
    "phone": "0996 834 699",
    "latitude": "33.517014",
    "longitude": " 36.275588"
  },
  {
    "id": 3,
    "logo": "assets/tableha/list/4.jpg",
    "isRes": false,
    "isOpen": true,
    "resName": "Dunkin Dnouts",
    "address": "Malki - Zanubia Street",
    "distance": "300 Km From You",
    "isFav": true,
    "rate": 3,
    "openTime": "9:00 AM",
    "closeTime": "2:30 AM",
    "about":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    "offer":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "fbAdress": "FaceBook.Com",
    "instAdress": "Instagam.insta",
    "moreImg": ["assets/tableha/list/3-1.jpg", "assets/tableha/list/3-2.jpg"],
    "phone": "0996 888 696",
    "latitude": "33.519139",
    "longitude": " 36.281845"
  },
  {
    "id": 4,
    "logo": "assets/tableha/list/3.jpg",
    "isRes": true,
    "isOpen": false,
    "resName": "KFC Restaurent",
    "address": "Abo Remaneh",
    "distance": "400 Km From You",
    "isFav": false,
    "rate": 2,
    "openTime": "9:00 AM",
    "closeTime": "2:30 AM",
    "about":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    "offer":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "fbAdress": "FaceBook.Com",
    "instAdress": "Instagam.insta",
    "moreImg": [
      "assets/tableha/list/4-1.jpg",
      "assets/tableha/list/4-2.jpg",
      "assets/tableha/list/4-3.jpg"
    ],
    "phone": "0996 834 999",
    "latitude": "33.518933",
    "longitude": " 36.282878"
  },
];

List<resItem> res = (data as List).map((i) => resItem.fromJson(i)).toList();

List<LatLng> makers = (data as List)
    .map((i) =>
        LatLng(double.parse(i["latitude"]), double.parse(i["longitude"])))
    .toList();
