import 'package:blogger/blogs/av_blog_listing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'extensions.dart';

class AVBlogsSection extends StatelessWidget {
  static Route<Object> route() {
    return MaterialPageRoute(builder: (context) => AVBlogsSection());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: blogContainer(context),
    );
  }

  Container blogContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: context.isDarkMode() ? Color(0xff333333) : Color(0xffeeeeee),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [nameText(context), Expanded(child: BlogListing())],
      ),
    );
  }

  Widget nameText(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Color(0xff333333)),
      child: Text(
        "ANMOL VERMA",
        style: GoogleFonts.merriweatherSans(
            letterSpacing: 8, color: Colors.white, fontSize: 50),
      ),
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 28),
    );
  }
}
