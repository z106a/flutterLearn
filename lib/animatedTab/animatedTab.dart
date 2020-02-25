import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class TabHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          title: Text('Animated tab'),
        ),
        body: TabPage());
  }
}

class TabPage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<TabPage> {
  MenuItem _active;
  List items = [
    MenuItem(x: -1.0, name: 'house', color: Colors.lightBlue[100]),
    MenuItem(x: -0.5, name: 'house', color: Colors.purple),
    // MenuItem(x: 0.0, name: 'house', color: Colors.greenAccent),
    // MenuItem(x: 0.5, name: 'house', color: Colors.pink),
    // MenuItem(x: 1.0, name: 'house', color: Colors.yellow),
  ];

  @override
  void initState() {
    super.initState();
    _active = items[0];
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: 80,
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            alignment: Alignment(_active.x, -1),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              height: 8,
              width: w * 0.2,
              color: _active.color,
            ),
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: items.map((item) {
              return _flare(item);
            }).toList(),
          ))
        ],
      ),
    );
  }

  Widget _flare(MenuItem item) {
    return GestureDetector(
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: FlareActor(
            'assets/flare/${item.name}.flr',
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: item.name == _active.name ? 'Indeterminate' : 'idle',
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _active = item;
        });
      },
    );
  }
}

class MenuItem {
  final String name;
  final Color color;
  final double x;
  MenuItem({this.name, this.color, this.x});
}
