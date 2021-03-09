import 'package:blogger/reusable/inkwell_mouse_region.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class StylesTabItem extends StatefulWidget {
  final String primary;
  final String secondary;
  final Function() callback;

  StylesTabItem({this.primary, this.secondary, this.callback});

  @override
  _StylesTabItemState createState() => _StylesTabItemState();
}

class _StylesTabItemState extends State<StylesTabItem> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWellMouseRegion(
      onTap: () {
        widget.callback();
      },
      onHover: (value) {
        setState(() {
          hovered = value;
        });
      },
      child: Container(
        child: RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                    text: widget.primary,
                    style:
                    GoogleFonts.merriweatherSans(
                        color: hovered ? Colors.green : Colors.white54),
                  ),
                  TextSpan(
                    text: " " + widget.secondary,
                    style: GoogleFonts.merriweatherSans(
                        color: hovered ? Colors.green : Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ])),
        margin: EdgeInsets.only(right: 10, bottom: 10),
      ),
    );
  }
}
