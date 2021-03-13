import 'package:blogger/presentations/model/Presentation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:url_launcher/url_launcher.dart';

class PresentationsWidget extends StatefulWidget {
  @override
  _PresentationsWidgetState createState() => _PresentationsWidgetState();
}

class _PresentationsWidgetState extends State<PresentationsWidget> {
  static const _pageSize = 20;

  final PagingController<int, Presentation> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      var newItems = <Presentation>[];
      newItems.add(Presentation(
          title: "gRPC for Kotlin developers - Google Slides",
          description: "",
          time: DateTime.now(),
          image:
              "https://lh4.googleusercontent.com/Bu9lTIXAKwbtBkM33DIk6k8VxKO-C_9GjyGPNdL54HXG0j1PajJGfXDZyAvuXmDyukVATv-v_G2LkQ=w1200-h630-p",
          url:
              "https://docs.google.com/presentation/d/1BGfpdKYQ1lMfNnuourUrgJGw98RPN5CGsTjXqgKeS8g/edit?usp=sharing"));

      newItems.add(Presentation(
          title: "SOLID Principles 🧙‍♂️ - Google Slides",
          description: "",
          time: DateTime.now(),
          image:
              "https://lh4.googleusercontent.com/VMU-eFpfsGSmWDmD8DQGyg-fo3bY9W3aobd2pXe8mOWM91OGjdr9MuxAiB8m0Q4Z6OX3oSVQZRy0Tw=w1200-h630-p",
          url:
              "https://docs.google.com/presentation/d/1Lmgh7YwYLMDqHktVeg0rDQLSlACLLRNJXo3u4gL3q90/edit?usp=sharing"));
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      print(error);
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) => PagedListView<int, Presentation>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Presentation>(
          itemBuilder: (context, item, index) => Card(
            margin: EdgeInsets.all(16),
            child: ListTile(
              onTap: (){
                launch(item.url);
              },
              leading: Image(
                image: NetworkImage(item.image),
                fit: BoxFit.cover,
              ),
              title: Text(
                item.title,
                style: GoogleFonts.roboto(),
              ),
              subtitle: Text(
                item.description,
                style: GoogleFonts.roboto(),
              ),
            ),
          ),
        ),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
