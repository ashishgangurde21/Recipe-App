import 'package:firestore_withlogin/screens/UserDetails2.dart';
import 'package:firestore_withlogin/screens/favourites.dart';
import 'package:firestore_withlogin/screens/addScreen.dart';
import 'package:firestore_withlogin/screens/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          body: TabBarView(
            children: <Widget>[HomeScreen(), Favourites()],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Color(0xff112E6A),
            ),
            height: 60,
            child: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Color(0xff87CDFF),
              labelStyle: TextStyle(fontSize: 10.0),
              indicator: UnderlineTabIndicator(),
              indicatorColor: Colors.black54,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.event,
                    size: 24.0,
                  ),
                  text: 'Homepage',
                ),
                Tab(
                  icon: Icon(
                    Icons.home,
                    size: 28.0,
                  ),
                  text: 'Favourites',
                ),
              ],
            ),
          ),
        ));
  }
}
