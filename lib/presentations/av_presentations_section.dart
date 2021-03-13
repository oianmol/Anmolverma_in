import 'package:blogger/common/common_subsection_container.dart';
import 'package:blogger/presentations/presentations_widget.dart';
import 'package:flutter/material.dart';

class AVPresentationsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonSubsectionContainer(
          sectionTitle: "Presentations", sectionWidget: PresentationsWidget()),
    );
  }

  static Route<Object> route() {
    return MaterialPageRoute(builder: (context) => AVPresentationsSection());
  }
}
