import 'package:flutter/material.dart';

class Presentation {
  final String title;
  final String description;
  final DateTime time;
  final String image;
  final String url;

  Presentation(
      {@required this.title,
      @required this.description,
      @required this.time,
      @required this.image,
      @required this.url});
}
