import 'package:flutter/material.dart';
import 'package:flutter_gmail_redesign/favorite.dart';
import 'package:flutter_gmail_redesign/inbox.dart';
import 'package:flutter_gmail_redesign/profile.dart';
import 'package:flutter_gmail_redesign/search.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: GmailHome(),
    );
  }
}

class GmailHome extends StatefulWidget {
  GmailHome({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _GmailHomeState createState() => _GmailHomeState();
}

class _GmailHomeState extends State<GmailHome> {

  int selectedIndex = 0;

  PageController controller = PageController();

  List<GButton> tabs = new List();
  final List<Widget> _children = [
    Inbox(),
    Search(),
    Favorite(),
    Profile(),
  ];

  @override
  void initState() {
    super.initState();

    var padding = EdgeInsets.symmetric(horizontal: 12, vertical: 5);
    double gap = 30;

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.blue,
      iconColor: Colors.blue,
      textColor: Colors.blue,
      color: Colors.blue[50],
      iconSize: 24,
      padding: padding,
      icon: LineIcons.inbox,
      // textStyle: t.textStyle,
      text: 'Inbox',
    ));

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.blue,
      iconColor: Colors.blue,
      textColor: Colors.blue,
      color: Colors.blue[50],
      iconSize: 24,
      padding: padding,
      icon: LineIcons.search,
      // textStyle: t.textStyle,
      text: 'Search',
    ));

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.blue,
      iconColor: Colors.blue,
      textColor: Colors.blue,
      color: Colors.blue[50],
      iconSize: 24,
      padding: padding,
      icon: LineIcons.star,
      // textStyle: t.textStyle,
      text: 'Favourite',
    ));

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.blue,
      iconColor: Colors.blue,
      textColor: Colors.blue,
      color: Colors.blue[50],
      iconSize: 24,
      padding: padding,
      icon: LineIcons.user,
      // textStyle: t.textStyle,
      text: 'Profile',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBody: true,
        body: PageView.builder(
          onPageChanged: (page) {
            setState(() {
              selectedIndex = page;
            });
          },
          controller: controller,
          itemBuilder: (context, position) {
            return Container(child: _children[position],);
          },
          itemCount: tabs.length, // Can be null
        ),
        // backgroundColor: Colors.green,
        // body: Container(color: Colors.red,),
        bottomNavigationBar: SafeArea(
          child: Container(
            decoration: BoxDecoration(color :Colors.white,boxShadow: [
              BoxShadow(spreadRadius: -10, blurRadius: 60, color: Colors.black.withOpacity(.20), offset: Offset(0,15))
            ]),
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: GNav(
                  tabs: tabs,
                  selectedIndex: selectedIndex,
                  onTabChange: (index) {
                    print(index);
                    setState(() {
                      selectedIndex = index;
                    });
                    controller.jumpToPage(index);
                  }),
            ),
          ),
        ),

      ),
    );
  }
}