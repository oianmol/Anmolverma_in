import 'package:blogger/blogs/av_blog_listing.dart';
import 'package:blogger/common/common_subsection_container.dart';
import 'package:flutter/material.dart';

class AVBlogsSection extends StatelessWidget {
  static Route<Object> route() {
    return MaterialPageRoute(builder: (context) => AVBlogsSection());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonSubsectionContainer(
          sectionTitle: "Blogs", sectionWidget: BlogListing()),
    );
  }
}
