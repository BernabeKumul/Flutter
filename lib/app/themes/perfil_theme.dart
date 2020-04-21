import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

BoxDecoration imageBoxDecoration(bluradius, offsetcX, offsetcY) =>
    BoxDecoration(
      color: Colors.white,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: bluradius,
          offset: Offset(offsetcX, offsetcY),
        ),
      ],
    );

Positioned positionedImage(path) => Positioned(
    left: 110,
    right: 110,
    child: Stack(
      children: <Widget>[
        DecoratedBox(decoration: imageBoxDecoration(10.0, 10.0, 4.0)),
        CircleAvatar(
          backgroundImage: AssetImage("$path"),
          backgroundColor: Colors.blueAccent,
          radius: 30.0,
        ),
      ],
    ));

Text textName(text) => Text(
      "$text",
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w700,
      ),
    );

Text textGray(text) => Text(
      "$text",
      style: TextStyle(
          color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 16),
    );
