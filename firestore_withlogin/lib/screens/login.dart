import 'package:firestore_withlogin/screens/UserDetails2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'signup.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  Future hidestatusbar() => SystemChrome.setEnabledSystemUIOverlays([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          FutureBuilder(
            future: _firebaseApp,
            builder: (context, snapshot) {
              return Center(
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
                                'https://images.unsplash.com/photo-1488866022504-f2584929ca5f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=743&q=80',
                                fit: BoxFit.fill,
                              ),
                              color: Colors.black,
                              height: MediaQuery.of(context).size.height / 4,
                              width: MediaQuery.of(context).size.width,
                            ),
                            Positioned(
                              child: Center(
                                child: CircleAvatar(
                                  radius: 94,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 90,
                                    backgroundImage: NetworkImage(
                                        'https://images.unsplash.com/photo-1541562232579-512a21360020?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80'),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: MediaQuery.of(context).size.height / 70,
                              left: MediaQuery.of(context).size.width / 12,
                              child: Center(
                                child: Text(
                                  'Login Here...',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ]),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(color: Colors.white)),
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
                              child: Text('Login',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  )),
                            ),
                            onPressed: () async {
                              if (email.text.isEmpty || password.text.isEmpty) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text('Please enter details'),
                                ));
                              } else {
                                try {
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: email.text,
                                          password: password.text)
                                      .then((value) {
                                    hidestatusbar();
                                    Navigator.of(context).pushReplacementNamed(
                                        UserInformation2.routeName);
                                  });
                                } catch (e) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(e.toString()),
                                  ));
                                }
                                // Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                              }
                            })),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                          child: Text(
                            'Signup',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(SignupScreen.routeName);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}