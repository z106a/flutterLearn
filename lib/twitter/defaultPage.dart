import 'package:flutter/material.dart';

class TwitterProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TwitterProfilePage();
}

class _TwitterProfilePage extends State<TwitterProfilePage> {
  static double avatarMaximumRadius = 40.0;
  static double avatarMinimumRadius = 15.0;
  double avatarRadius = avatarMaximumRadius;
  double expandedHeader = 130.0;
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.blueGrey[900],
            body: NotificationListener<ScrollUpdateNotification>(
              onNotification: (scrollNotification) {
                final pixels = scrollNotification.metrics.pixels;
                // check if scroll is vertical ( left to right OR right to left)
                final scrollTabs = (scrollNotification.metrics.axisDirection ==
                        AxisDirection.right ||
                    scrollNotification.metrics.axisDirection ==
                        AxisDirection.left);
                if (!scrollTabs) {
                  // and here prevents animation of avatar when you scroll tabs
                  if (expandedHeader - pixels <= kToolbarHeight) {}
                }

                return false;
              },
              child: DefaultTabController(
                length: 8,
                child: CustomScrollView(
                  physics: ClampingScrollPhysics(),
                  slivers: <Widget>[
                    SliverAppBar(
                      expandedHeight: expandedHeader,
                      backgroundColor: Colors.grey,
                      leading: BackButton(
                        color: isExpanded ? Colors.grey : Colors.white,
                      ),
                      pinned: true,
                      elevation: 5.0,
                      forceElevated: true,
                      flexibleSpace: Container(
                        decoration: BoxDecoration(
                            color: isExpanded
                                ? Colors.transparent
                                : Colors.blue[800],
                            image: isExpanded
                                ? DecorationImage(
                                    fit: BoxFit.fill,
                                    alignment: Alignment.bottomCenter,
                                    image: AssetImage(
                                        'assets/bg/twitter_flutter_bg.jpg'))
                                : null),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: isExpanded
                              ? Transform(
                                  transform: Matrix4.identity()
                                    ..translate(0.0, avatarMaximumRadius),
                                  child: Avatar(size: avatarRadius,),
                                )
                              : SizedBox.shrink(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}

class Avatar extends StatelessWidget {
  final double size;

  const Avatar({this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey[800],
              width: 2.0,
            ),
            shape: BoxShape.circle),
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: CircleAvatar(
            radius: size,
            backgroundImage:
                AssetImage("assets/twitter/twitter_flutter_logo.png"),
          ),
        ),
      ),
    );
  }
}
