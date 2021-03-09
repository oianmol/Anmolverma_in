import 'package:flutter/material.dart';

class AVBlogsDirectory extends StatefulWidget {
  @override
  _AVBlogsDirectoryState createState() => _AVBlogsDirectoryState();

  static Route<Object> route() {
    return MaterialPageRoute(builder: (context) => AVBlogsDirectory());
  }
}

class _AVBlogsDirectoryState extends State<AVBlogsDirectory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("WIP"),
      ),
    );
  }
}
