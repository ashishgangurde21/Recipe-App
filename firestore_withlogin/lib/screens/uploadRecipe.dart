import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  CollectionReference ref = FirebaseFirestore.instance.collection('Recipes');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var category;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController stepsController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Upload'),
        ),
        body: Container(
            child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: TextFormField(
                controller: titleController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                    labelText: 'Title*',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: authorController,
                decoration: InputDecoration(
                    labelText: 'Author*',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: descriptionController,
                decoration: InputDecoration(
                    labelText: 'Description*',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
                margin: EdgeInsets.all(20),
                child: DropdownButton(
                  hint: category == null
                      ? Text('Select Category*',
                          style: TextStyle(color: Colors.black))
                      : Text(
                          category,
                          style: TextStyle(color: Colors.black),
                        ),
                  items: <String>[
                    'Indian',
                    'Continental',
                    'Punjabi',
                    'South Indian'
                  ].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    );
                  }).toList(),
                  onChanged: (String value) {
                    setState(() {
                      category = value;
                    });
                  },
                )),
            Container(
              margin: EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: ingredientsController,
                decoration: InputDecoration(
                    labelText: 'Ingredients*',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: stepsController,
                decoration: InputDecoration(
                    labelText: 'Steps*',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: imageUrlController,
                decoration: InputDecoration(
                    labelText: 'Image url',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Center(
                child: ElevatedButton(
                    child: Text('Upload'),
                    onPressed: () async {
                      if (authorController.text.isNotEmpty &&
                          titleController.text.isNotEmpty &&
                          descriptionController.text.isNotEmpty &&
                          ingredientsController.text.isNotEmpty &&
                          stepsController.text.isNotEmpty &&
                          imageUrlController.text.isNotEmpty &&
                          category != null) {
                        await ref.add({
                          'author': authorController.text,
                          'Title': titleController.text,
                          'description': descriptionController.text,
                          'ingredients': ingredientsController.text,
                          'steps': stepsController.text,
                          'imageUrl': imageUrlController.text,
                          'category': category,
                          'userId': _auth.currentUser.uid
                        });
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Please fill all the fields")));
                      }
                    }),
              ),
            )
          ],
        )));
  }
}
