import 'package:blogger/extended_blog_tabs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
        children: [bgImage(context), homeContainerChild()],
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
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.grey,
          BlendMode.saturation,
        ),
        child: Image(
          image: new AssetImage(path("img.jpg")),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  String path(str) {
    return (kIsWeb) ? 'assets/$str' : str;
  }
}
