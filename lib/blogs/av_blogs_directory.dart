import 'package:blogger/blogs/av_blog_listing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AVBlogsDirectory extends StatelessWidget {
  static Route<Object> route() {
    return MaterialPageRoute(builder: (context) => AVBlogsDirectory());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      body: blogContainer(context),
    );
  }

  Container blogContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Color(0xff333333)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [nameText(), Expanded(child: BlogListing())],
      ),
    );
  }

  Widget nameText() {
    return Container(
      child: Text(
        "ANMOL VERMA",
        style: GoogleFonts.merriweatherSans(
            letterSpacing: 8, color: Colors.white, fontSize: 50),
      ),
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 28),
    );
  }
}
