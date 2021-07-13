import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_withlogin/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserInformation2 extends StatefulWidget {
  static const routeName = '/UserInformation2';

  @override
  _UserInformation2State createState() => _UserInformation2State();
}

class _UserInformation2State extends State<UserInformation2> {
  final firestoreInstance = FirebaseFirestore.instance; //FireStore instance
  bool retrival = false;
  String name = "";
  String age = "";
  String city = "";
  String email = "";
  TextEditingController rename = TextEditingController();
  TextEditingController reage = TextEditingController();
  TextEditingController recity = TextEditingController();
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('Users');

  var firebaseUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User Information'),
        ),
        body: Container(
            child: StreamBuilder(
          stream: collectionReference.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
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
                        onPressed: () {
                          firestoreInstance
                              .collection("Users")
                              .doc(firebaseUser.uid)
                              .get() //get method is used to get the data of the particular document of the unique id which matches with the current user.
                              .then(
                            (value) {
                              name = value.data()['Name'];
                              age = value.data()['Age'];
                              city = value.data()['City'];
                              email = value.data()['email'];
                              setState(() {
                                retrival = true;
                              });
                            },
                          );
                        },
                        child: Text('Retrive'),
                      ),
                      ElevatedButton(
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
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(LoginScreen.routeName);
                          },
                          child: Text('Logout'))
                    ],
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'Name',
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Text(retrival ? name : "",
                            style:
                                TextStyle(color: Colors.black, fontSize: 25)),
                      ),
                      leading: Icon(
                        Icons.person,
                        size: 40,
                      ),
                      trailing: ElevatedButton(
                        child: Icon(Icons.update),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Enter New Name: -'),
                                  content: TextField(
                                    controller: rename,
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: Text('Update')),
                                  ],
                                );
                              });
                        },
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'Email',
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Text(email,
                            style:
                                TextStyle(color: Colors.black, fontSize: 25)),
                      ),
                      leading: Icon(
                        Icons.email,
                        size: 40,
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'Age',
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Text(age,
                            style:
                                TextStyle(color: Colors.black, fontSize: 25)),
                      ),
                      leading: Icon(
                        Icons.calendar_view_day,
                        size: 40,
                      ),
                      trailing: ElevatedButton(
                        child: Icon(Icons.update),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Enter New Age: -'),
                                  content: TextField(
                                    controller: reage,
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: Text('Update')),
                                  ],
                                );
                              });
                        },
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'City',
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Text(city,
                            style:
                                TextStyle(color: Colors.black, fontSize: 25)),
                      ),
                      leading: Icon(
                        Icons.location_city,
                        size: 40,
                      ),
                      trailing: ElevatedButton(
                        child: Icon(Icons.update),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Enter New Name: -'),
                                  content: TextField(
                                    controller: recity,
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: Text('Update')),
                                  ],
                                );
                              });
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
            return Center();
          },
        )));
  }
}
