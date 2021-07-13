import 'package:firestore_withlogin/screens/UserDetails2.dart';
import 'package:firestore_withlogin/screens/userDetails.dart';
import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/homescreen.dart';
import 'screens/UserDetails2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool theme = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.light,
      home: LoginScreen(),
      routes: {
        SignupScreen.routeName: (ctx) => SignupScreen(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        UserInformation.routeName: (ctx) => UserInformation(),
        UserInformation2.routeName: (ctx) => UserInformation2()
      },
    );
  }
}
