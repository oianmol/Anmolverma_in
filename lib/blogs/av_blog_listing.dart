import 'package:blogger/blogs/blog_paginated_list.dart';
import 'package:flutter/material.dart';

class BlogListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: BlogPaginatedList(),
    );
  }
}
