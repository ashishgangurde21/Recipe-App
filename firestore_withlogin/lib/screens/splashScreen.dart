import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_withlogin/Custom%20Widgets/Bottom_Bar.dart';
import 'package:firestore_withlogin/screens/homescreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    Timer(
        Duration(seconds: 3),
        () => FirebaseFirestore.instance
            .collection('Recipes')
            .get()
            .then((value) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomNav(bottomRef: value),
                ))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              child: Image.asset(
                'lib/SplashscreenPic/foodzo.png',
                fit: BoxFit.cover,
              ),
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 3,
              left: MediaQuery.of(context).size.width / 2.3,
              child: Container(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
