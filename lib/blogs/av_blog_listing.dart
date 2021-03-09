import 'package:flutter/material.dart';

class BlogListing extends StatefulWidget {
  @override
  _BlogListingState createState() => _BlogListingState();
}

class _BlogListingState extends State<BlogListing> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Colors.white),
    );
  }
}
