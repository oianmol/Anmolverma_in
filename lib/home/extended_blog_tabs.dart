import 'package:anmolverma_in/anmolverma_in.dart';
import 'package:blogger/blogRoutes.dart';
import 'package:blogger/blogs/av_blogs_section.dart';
import 'package:blogger/home/av_home.dart';
import 'package:blogger/home/styled_tab_item.dart';
import 'package:blogger/presentations/av_presentations_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:go_router/go_router.dart';

class ExtendedBlogTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var tabs = buildTabs(context);
      return showVerticalLayout(constraints)
          ? verticalTabs(tabs)
          : horizontalTabs(tabs);
    });
  }

  bool showVerticalLayout(BoxConstraints constraints) =>
      constraints.maxWidth < 600;

  Row horizontalTabs(List<Widget> tabs) {
    return Row(
      children: tabs..add(Spacer()),
    );
  }

  Column verticalTabs(tabs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: tabs,
    );
  }

  List<Widget> buildTabs(BuildContext context) {
    return [
      styledTabItem("about", "Me", () {
        context.push(resumeRoute);
      }),
      styledTabItem("watch", "Presentations", () {
        context.push(presentationRoute);
      }),
      styledTabItem("fork", "GitHub", () {
        launch("https://github.com/anmol92verma/");
      }),
      styledTabItem("mention", "Twitter", () {
        launch("https://twitter.com/_AnmolVerma_");
      }),
      /*styledTabItem("read", "Blog", () {
        Navigator.of(context).push(AVBlogsSection.route());
      }),*/
    ];
  }

  Widget styledTabItem(String primary, String secondary, Function() callback) {
    return StylesTabItem(
      primary: primary,
      secondary: secondary,
      callback: callback,
    );
  }
}
