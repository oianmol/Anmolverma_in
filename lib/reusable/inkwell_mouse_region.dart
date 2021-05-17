import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import "package:universal_html/html.dart" as html;

class InkWellMouseRegion extends InkWell {
  InkWellMouseRegion({
    Key key,
    @required Widget child,
    @required GestureTapCallback onTap,
    ValueChanged<bool> onHover,
    double borderRadius = 0,
  }) : super(
    key: key,
    child: !kIsWeb ? child : HoverAware(child: child),
    onTap: onTap,
    onHover: onHover,
    borderRadius: BorderRadius.circular(borderRadius),
  );
}

class HoverAware extends MouseRegion {

  // get a reference to the body element that we previously altered
  static final appContainer = html.window.document.getElementById('app-container');

  HoverAware({Widget child}) : super(
      onHover: (PointerHoverEvent evt) {
        appContainer.style.cursor='pointer';
        // you can use any of these:
        // 'help', 'wait', 'move', 'crosshair', 'text' or 'pointer'
        // more options/details here: http://www.javascripter.net/faq/stylesc.htm
      },
      onExit: (PointerExitEvent evt) {
        // set cursor's style 'default' to return it to the original state
        appContainer.style.cursor='default';
      },
      child: child
  );

}