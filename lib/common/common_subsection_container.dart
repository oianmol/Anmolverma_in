import 'package:flutter/material.dart';
import 'package:blogger/blogs/extensions.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonSubsectionContainer extends StatelessWidget {

  final String sectionTitle;
  final Widget sectionWidget;

  CommonSubsectionContainer({required this.sectionTitle,required this.sectionWidget});

  @override
  Widget build(BuildContext context) {
    return blogContainer(context);
  }

  Container blogContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: context.isDarkMode() ? Color(0xff333333) : Color(0xffeeeeee),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [nameText(context), Expanded(child: sectionWidget)],
      ),
    );
  }

  Widget nameText(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Color(0xff333333)),
      child: Text(
        sectionTitle,
        style: GoogleFonts.merriweatherSans(
            letterSpacing: 8, color: Colors.white, fontSize: 50),
      ),
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 28),
    );
  }
}
