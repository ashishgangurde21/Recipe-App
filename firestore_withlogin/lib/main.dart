import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_withlogin/screens/favourites.dart';
import 'package:firestore_withlogin/screens/UserDetails2.dart';
import 'package:firestore_withlogin/screens/addScreen.dart';
import 'package:firestore_withlogin/screens/splashScreen.dart';
import 'package:firestore_withlogin/screens/userDetails.dart';
import 'package:flutter/material.dart';
import 'Custom Widgets/Bottom_Bar.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/homescreen.dart';
import 'screens/UserDetails2.dart';
import 'screens/addScreen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //bool theme = true;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return CircularProgressIndicator();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          final FirebaseAuth _auth = FirebaseAuth.instance;
          return MaterialApp(
            title: 'Flutter Demo',
            darkTheme: ThemeData(
                brightness: Brightness.dark, primarySwatch: Colors.blue),
            themeMode: ThemeMode.light,
            home: _auth.currentUser != null ? SplashScreen() : LoginScreen(),
            routes: {
              SignupScreen.routeName: (ctx) => SignupScreen(),
              LoginScreen.routeName: (ctx) => LoginScreen(),
              UserInformation.routeName: (ctx) => UserInformation(),
              UserInformation2.routeName: (ctx) => UserInformation2(),
              AddItem.routeName: (ctx) => AddItem(),
              Favourites.routeName: (ctx) => Favourites(),
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}
