import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var collection = FirebaseFirestore.instance.collection('Users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
          child: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
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
                bottom: MediaQuery.of(context).size.height / 1.5,
                left: MediaQuery.of(context).size.width / 3.6,
                child: Center(
                  child: CircleAvatar(
                    radius: 84,
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
                top: MediaQuery.of(context).size.height / 3,
                child: Container(
                  child: StreamBuilder(
                      stream: collection
                          .doc(FirebaseAuth.instance.currentUser.uid.toString())
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return new Text("Loading");
                        }
                        var userDocument = snapshot.data;
                        return Center(
                          child: Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                11,
                                      ),
                                      Icon(
                                        Icons.person,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          "Name : - ${userDocument["Name"].toString()}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                11,
                                      ),
                                      Icon(
                                        Icons.email_outlined,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          "Email : - ${userDocument["email"].toString()}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                11,
                                      ),
                                      Icon(
                                        Icons.calendar_today_outlined,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          "Age : - ${userDocument["Age"].toString()}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                11,
                                      ),
                                      Icon(
                                        Icons.home_filled,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          "City : - ${userDocument["City"].toString()}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 1.8,
                left: MediaQuery.of(context).size.width / 4,
                child: Container(
                    height: MediaQuery.of(context).size.height / 4,
                    child: Image.asset(
                      'lib/SplashscreenPic/profile_end.png',
                      fit: BoxFit.contain,
                    )),
              )
            ]),
          ),
        ],
      )),
    );
  }
}
