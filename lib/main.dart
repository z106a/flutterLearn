import 'package:flutter/material.dart';
import 'style.dart';
import 'cards.dart';
import 'login/login.dart';
import 'shop/shop.dart';
import 'animatedTab/animatedTab.dart';
import 'communication/defaultPage.dart';
import 'twitter/defaultPage.dart';

void main() => runApp(MyApp());

const _apps = [
  App(name: 'Cards'),
  App(name: 'Login'),
  App(name: 'Shop'),
  App(name: 'Tab'),
  App(name: 'Communication'),
  App(name: 'Twitter'),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      // home: HomePage(),
      onGenerateRoute: routes,
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) {
        return PageChooser();
      });
    } else {
      return MaterialPageRoute(builder: (context) {
        final idx = int.parse(settings.name.replaceFirst('/', ''));
        final String name = _apps[idx].name;

        switch (name) {
          case 'Cards':
            return CardsHome();
          case 'Login':
            return LoginHome();
          case 'Shop':
            return ShopHome();
          case 'Tab':
            return TabHome();
          case 'Communication':
            return CommunicationDefaultPage();
          case 'Twitter':
            return TwitterProfilePage();
          default:
            return PageChooser();
        }
      });
    }
  }
}

class App {
  const App({this.name});
  final String name;
}

class PageChooser extends StatelessWidget {
  Widget _buildAppList(BuildContext context, int index) {
    return new GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/$index');
      },
      child: Container(
        alignment: Alignment.center,
        // color: Theme.of(context).primaryColor.withOpacity(0.7),
        child: Container(
          width: 200.0,
          margin: EdgeInsets.only(top: 10.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: const Color(0xFF2b2929).withOpacity(0.9),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: Text(
            _apps[index].name,
            textAlign: TextAlign.center,
            // style: Theme.of(context).textTheme.headline,
            style: mainMenuItemStyle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              semanticLabel: 'menu',
            ),
            onPressed: () {}),
        title: Text('Apps'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                semanticLabel: 'search',
              ),
              onPressed: null),
          IconButton(
              icon: Icon(
                Icons.tune,
                semanticLabel: 'filter',
              ),
              onPressed: null),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg/1.jpeg"), fit: BoxFit.cover),
        ),
        child: ListView.builder(
          itemCount: _apps.length,
          itemExtent: 60.0,
          itemBuilder: _buildAppList,
        ),
      ),
    );
  }
}
