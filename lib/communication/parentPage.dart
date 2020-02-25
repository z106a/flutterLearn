import 'package:flutter/material.dart';
import 'child1.dart';

class ParentPage extends StatefulWidget {
  @override
  _ParentPage createState() => _ParentPage();
}

class ParentProvider extends InheritedWidget {
  final TabController tabController;
  final Widget child;
  final String title;

  ParentProvider({this.tabController, this.child, this.title});

  @override
  bool updateShouldNotify(ParentProvider oldWidget) {
    return true;
  }

  static ParentProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ParentProvider>();
}

class _ParentPage extends State<ParentPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  String myTitle = "Parent";
  String updateChild2Title;
  String updateChild1Title = "";

  @override
  void initState() {
    _controller = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  updateChild2(String text) {
    setState(() {
      updateChild2Title = text;
    });
  }

  updateParent(String text) {
    setState(() {
      myTitle = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ParentProvider(
      tabController: _controller,
      title: updateChild2Title,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              myTitle,
              textAlign: TextAlign.center,
            ),
          ),
          RaisedButton(
              child: Text("Action 1"),
              onPressed: () {
                setState(() {
                  updateChild1Title = "Was update from Parent";
                });
              }),
          TabBar(controller: _controller, tabs: [
            Tab(
              text: "First",
              icon: Icon(Icons.check_circle),
            ),
            Tab(
              text: "Second",
              icon: Icon(Icons.crop_square),
            )
          ]),
          Expanded(
            child: TabBarView(controller: _controller, children: [
              Child1Page(
                title: updateChild1Title,
                child2Action2: updateParent,
                child2Action3: updateChild2,
              ),
              Text("2"),
            ]),
          )
        ],
      ),
    );
  }
}
