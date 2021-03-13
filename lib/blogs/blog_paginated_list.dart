import 'package:blogger/blogs/model/blog.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class BlogPaginatedList extends StatefulWidget {
  @override
  _BlogPaginatedListState createState() => _BlogPaginatedListState();
}

class _BlogPaginatedListState extends State<BlogPaginatedList> {
  static const _pageSize = 20;

  final PagingController<int, Blog> _pagingController =
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
      //final newItems = await RemoteApi.getCharacterList(pageKey, _pageSize);
      await Future.delayed(Duration(milliseconds: 800));
      var newItems = <Blog>[];
      for (var index = 0; index < 20; index++) {
        newItems.add(Blog(
            title: "Work in progress! $index",
            description: "",
            time: DateTime.now().add(Duration(days: index + 1))));
      }

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
  Widget build(BuildContext context) => PagedListView<int, Blog>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Blog>(
          itemBuilder: (context, item, index) => Card(
            margin: EdgeInsets.all(16),
            child: ListTile(
              title: Text(item.title),
              subtitle: Text(item.description),
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
