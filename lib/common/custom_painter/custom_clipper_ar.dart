import 'package:flutter/material.dart';
  class ClippingAppBarAr extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, 0.0);
    path.lineTo(0.0, size.height);
    path.quadraticBezierTo(size.width/1.4, size.height/1.2,
        (size.width) , 0.0);
    path.close();
    return path ;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}