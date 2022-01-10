import 'package:blogger/blogRoutes.dart';
import 'package:blogger/home/av_home.dart';
import 'package:flutter/material.dart';
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';

void main() {
  configureApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      darkTheme: ThemeData.dark(),
      title: 'Anmol Verma',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: blogRoutes.routeInformationParser,
      routerDelegate: blogRoutes.routerDelegate,
    );
  }
}
