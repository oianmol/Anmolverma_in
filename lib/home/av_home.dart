import 'dart:ui';

import 'package:blogger/home/extended_blog_tabs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class AVHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeContainer(context),
    );
  }

  homeContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Color(0xff333333)),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [bgImage(context), homeContainerChild(), dockStack()],
      ),
    );
  }

  Widget homeContainerChild() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          nameText(),
          SizedBox(
            height: 16,
          ),
          ExtendedBlogTabs()
        ],
      ),
    );
  }

  Text nameText() {
    return Text(
      "ANMOL VERMA",
      style: GoogleFonts.merriweatherSans(
          letterSpacing: 8, color: Colors.white, fontSize: 50),
    );
  }

  bgImage(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image(
        image: new AssetImage(path("img.webp")),
        fit: BoxFit.cover,
      ),
    );
  }

  logoImage(image, String name) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Column(children: [
        Image(
          image: new AssetImage(path(image)),
          fit: BoxFit.cover,
          width: 48,height: 48,
        ),
        SizedBox(height: 8,),
        Text(name,style: TextStyle(color: Colors.white),)
      ],),
    );
  }

  flutterLogo(String name) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Column(children: [
        FlutterLogo(
          size: 48
        ),
        SizedBox(height: 8,),
        Text(name,style: TextStyle(color: Colors.white),)
      ],),
    );
  }

  String path(str) {
    return 'assets/$str';
  }

  dockStack() {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.black26),
      child: Wrap(
        children: [
          logoImage("android.png","Android Studio"),
          logoImage("intellij.png","IntelliJ Idea"),
          flutterLogo( "Flutter")
        ],
      ),
    );
  }
}
