import 'package:firestore_withlogin/Custom%20Widgets/Bottom_Bar.dart';
import 'package:firestore_withlogin/Custom%20Widgets/drawer.dart';
import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  static const routeName = '/Additem';
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawers(),
      bottomNavigationBar: BottomNav(),
      body: Container(
        child: Center(child: Text('This is the Add screen')),
      ),
    );
  }
}
