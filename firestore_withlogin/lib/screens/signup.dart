import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_withlogin/screens/UserDetails2.dart';
import 'package:firestore_withlogin/screens/userDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'homescreen.dart';

class SignupScreen extends StatelessWidget {
  static const routeName = '/signup';

  Future<FirebaseApp> _firebaseApp =
      Firebase.initializeApp(); //Initialization of the Firebase
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController age = TextEditingController();

  Future hidestatusbar() => SystemChrome.setEnabledSystemUIOverlays([]);

  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('Users');
  //Here we use The CollectionReference class to declare a variable of the same type.
  //The variable collectionReference will have nothing but the instance of the FireStore of the collection in it.
  //It is only declared so that whenever you require "FirebaseFirestore.instance.collection('data');" this instance..instead of that use the variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2.5,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(children: [
                        Container(
                          child: Image.network(
                            "https://images.unsplash.com/photo-1550989460-0adf9ea622e2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                            fit: BoxFit.cover,
                          ),
                          color: Colors.black,
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Positioned(
                          child: Center(
                            child: CircleAvatar(
                              radius: 84,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 80,
                                backgroundImage: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrb7XeVpElaj3yF0M2zBadpBwR1H32HQQumw&usqp=CAU'),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: MediaQuery.of(context).size.height / 70,
                          left: MediaQuery.of(context).size.width / 12,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
                            child: Text(
                              'Signup Page',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
                FutureBuilder(
                    future: _firebaseApp,
                    builder: (context, snapshot) {
                      return Center(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                              child: TextField(
                                controller: email,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                              child: TextField(
                                controller: password,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  border: OutlineInputBorder(),
                                ),
                                obscureText: true,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                              child: TextField(
                                controller: fullname,
                                decoration: InputDecoration(
                                  labelText: 'Full Name',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                              child: TextField(
                                controller: age,
                                decoration: InputDecoration(
                                  labelText: 'Age',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                              child: TextField(
                                controller: city,
                                decoration: InputDecoration(
                                  labelText: 'City',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13),
                                      side: BorderSide(color: Colors.white),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text('Signup',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                      )),
                                ),
                                onPressed: () async {
                                  if (email.text.isEmpty ||
                                      password.text.isEmpty ||
                                      fullname.text.isEmpty ||
                                      city.text.isEmpty ||
                                      age.text.isEmpty) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text('Please enter details'),
                                    ));
                                  } else {
                                    try {
                                      await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                              email: email.text,
                                              password: password.text)
                                          .then((value) async {
                                        var firebaseUser = //Getting the information of the current user Logged in
                                            FirebaseAuth.instance.currentUser;
                                        await collectionReference
                                            .doc(firebaseUser
                                                .uid) //Using the set Method instead of the add method to give the document a unique name same as the UID of the current user
                                            .set({
                                          //This will simply add the data to the database in the document with the unique document name as the UID of the user
                                          'email': email
                                              .text, //Here the thing to be noted is that the add method gives the document a auto/random name or id but set method is used to give a specific unique name.
                                          'Name': fullname
                                              .text, //This helps in actually integrating the authentication and the Firestore perfectly in sync and both things have a common UID as the particular user
                                          'Age': age.text,
                                          'City': city.text
                                        });
                                        Navigator.of(context)
                                            .pushReplacementNamed(UserInformation2
                                                .routeName); //Navigating to the UserDetails Page
                                      });
                                    } catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(e.toString()),
                                      ));
                                    }
                                  }
                                },
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                child: ElevatedButton(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child:
                                          Text('Already have account?\nLogin',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              )),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                              LoginScreen.routeName);
                                    })),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
