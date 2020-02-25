import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Widgets/FormCard.dart';
import 'Widgets/SocialIcon.dart';
import 'Widgets/CustomIcons.dart';

class LoginHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<LoginPage> {
  bool _isSelected = false;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.0),
        child: Container(
          width: ScreenUtil().setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    // ScreenUtil.init(context, width: 750, height: 1600, allowFontScaling: false);
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Image.asset("assets/login/login1.jpeg"),
            ),
            Expanded(
              child: Container(),
            ),
            Image.asset("assets/login/login1.jpeg")
          ],
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/login/login1.jpeg",
                      width: ScreenUtil().setWidth(110),
                      height: ScreenUtil().setHeight(110),
                    ),
                    Text(
                      "LOGO",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(46),
                        letterSpacing: .6,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(180),
                ),
                FormCard(),
                SizedBox(
                  height: ScreenUtil().setHeight(40),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 12.0,
                        ),
                        GestureDetector(
                          onTap: _radio,
                          child: radioButton(_isSelected),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "Remember me",
                          style: TextStyle(
                              fontSize: 12, fontFamily: "Poppins-Medium"),
                        ),
                      ],
                    ),
                    InkWell(
                      child: Container(
                        width: ScreenUtil().setWidth(330),
                        height: ScreenUtil().setHeight(100),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xff17ead9), Color(0xff6078ea)]),
                            borderRadius: BorderRadius.circular(6.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xff6078ea).withOpacity(.3),
                                  offset: Offset(0.0, 8.0),
                                  blurRadius: 8.0),
                            ]),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            child: Center(
                              child: Text(
                                "SIGNIN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins-Bold",
                                    fontSize: 18,
                                    letterSpacing: 1.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(40),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // horizontalLine(),
                    Text(
                      "Social Login",
                      style: TextStyle(
                          fontSize: 16.0, fontFamily: "Poppins-Medium"),
                    ),
                    // horizontalLine()
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(40),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocialIcon(
                      colors: [
                        Color(0xFF102397),
                        Color(0xFF187adf),
                        Color(0xFF00eaf8),
                      ],
                      iconData: CustomIcons.facebook,
                      onPressed: () {},
                    ),
                    SocialIcon(
                      colors: [
                        Color(0xFF102397),
                        Color(0xFF187adf),
                        Color(0xFF00eaf8),
                      ],
                      iconData: CustomIcons.linkedin,
                      onPressed: () {},
                    ),
                    SocialIcon(
                      colors: [
                        Color(0xFF102397),
                        Color(0xFF187adf),
                        Color(0xFF00eaf8),
                      ],
                      iconData: CustomIcons.twitter,
                      onPressed: () {},
                    ),
                    SocialIcon(
                      colors: [
                        Color(0xFF102397),
                        Color(0xFF187adf),
                        Color(0xFF00eaf8),
                      ],
                      iconData: CustomIcons.instagram,
                      onPressed: () {},
                    )
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "New User? ",
                      style: TextStyle(fontFamily: "Poppins-Medium"),
                    ),
                    InkWell(
                        onTap: () {},
                        child: Text(
                          "SignUp",
                          style: TextStyle(
                              color: Color(0xFF5d74e3),
                              fontFamily: "Poppins-Bold"),
                        ))
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
