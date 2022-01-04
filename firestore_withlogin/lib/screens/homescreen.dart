import 'package:firestore_withlogin/Custom%20Widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'package:firestore_withlogin/Custom Widgets/Bottom_Bar.dart';

// import 'signup.dart';
class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawers(),
      body: Center(child: Text('Welcome to the HomePage...')),
      bottomNavigationBar: BottomNav(),
    );
  }
}
