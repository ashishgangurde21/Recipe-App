import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_withlogin/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Drawers extends StatefulWidget {
  @override
  _DrawersState createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  final firestoreInstance = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth
      .instance.currentUser; //Getting the info about the current user.

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: [
              Container(
                child: Image.asset(
                  "lib/SplashscreenPic/drawer_img.jpg",
                  fit: BoxFit.cover,
                ),
                color: Colors.black,
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height / 4.5,
                left: MediaQuery.of(context).size.width / 4.5,
                child: Center(
                  child: CircleAvatar(
                    radius: 72,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 68,
                      child: ClipOval(
                        child: Image.asset(
                            'lib/SplashscreenPic/profile_buddy.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: h / 3.3,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: w / 3.6),
                        Icon(
                          Icons.person,
                          size: 24,
                        ),
                        SizedBox(width: w / 30),
                        Text(
                          "Profile",
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: h / 2.7,
                child: GestureDetector(
                  onTap: () {
                    launch('https://forms.gle/aDmEmrq9MyaWPefL6');
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: w / 4.2),
                        Icon(
                          Icons.feedback_outlined,
                          size: 24,
                        ),
                        SizedBox(width: w / 30),
                        Text(
                          "Feedback",
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: h / 2.3,
                child: GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: w / 3.8),
                        Icon(
                          Icons.logout_outlined,
                          size: 24,
                        ),
                        SizedBox(width: w / 30),
                        Text(
                          "Logout",
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
