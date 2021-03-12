import 'package:flutter/cupertino.dart';

extension BuildContextExtension on BuildContext {
  bool isDarkMode() {
    var brightness = MediaQuery.of(this).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return darkModeOn;
  }
}
