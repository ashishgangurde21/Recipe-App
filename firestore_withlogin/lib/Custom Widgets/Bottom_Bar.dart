import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_withlogin/screens/favourites.dart';
import 'package:firestore_withlogin/screens/homescreen.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  final QuerySnapshot bottomRef;
  const BottomNav({Key key, this.bottomRef}) : super(key: key);
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List docsList = [];
  final CollectionReference ref =
      FirebaseFirestore.instance.collection('Recipes');
  Future<void> getData() async {
    QuerySnapshot querySnapshot = await ref.get();
    docsList = querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    docsList = widget.bottomRef.docs.toList();
    print(docsList);
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          body: TabBarView(
            children: <Widget>[HomeScreen(data: docsList), Favourites()],
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
