import 'package:flutter/material.dart';

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

class ColourToHex extends StatefulWidget {
  @override
  _ColourToHexState createState() => _ColourToHexState();
}

class _ColourToHexState extends State<ColourToHex> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
