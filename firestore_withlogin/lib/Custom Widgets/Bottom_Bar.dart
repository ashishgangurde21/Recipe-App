import 'package:firestore_withlogin/Custom%20Widgets/favourites.dart';
import 'package:firestore_withlogin/screens/addScreen.dart';
import 'package:firestore_withlogin/screens/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      items: <Widget>[
        InkWell(
          child: Container(
              child: Icon(
            Icons.home_filled,
            size: 20,
            color: Colors.black,
          )),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          },
        ),
        InkWell(
          child: Container(
              child: Icon(
            Icons.add,
            size: 20,
            color: Colors.black,
          )),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(AddItem.routeName);
          },
        ),
        InkWell(
          child: Container(
              child: Icon(
            Icons.favorite_border_outlined,
            size: 20,
            color: Colors.black,
          )),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(Favourites.routeName);
          },
        ),
      ],
    );
  }
}
