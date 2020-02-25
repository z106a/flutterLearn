import 'package:flutter/material.dart';
import 'parentPage.dart';

class CommunicationDefaultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.dark(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Communications"),
          ),
          body: ParentPage(),
        ));
  }
}
