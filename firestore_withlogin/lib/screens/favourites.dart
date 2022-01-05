import 'package:firestore_withlogin/Custom%20Widgets/Bottom_Bar.dart';
import 'package:firestore_withlogin/Custom%20Widgets/drawer.dart';
import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  static const routeName = '/favourties';
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawers(),
      body: Center(child: Text('This is Favourites page..')),
    );
  }
}
