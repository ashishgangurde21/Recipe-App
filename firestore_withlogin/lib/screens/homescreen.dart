import 'package:carousel_slider/carousel_slider.dart';
import 'package:firestore_withlogin/Custom%20Widgets/drawer.dart';
import 'package:firestore_withlogin/screens/recipe.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'package:firestore_withlogin/Custom Widgets/Bottom_Bar.dart';

// import 'signup.dart';
class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawers(),
      body: ListView(
        children: [
          Column(
            children: [
              CarouselSlider(
                  items: <Widget>[
                    ListTile(
                        h,
                        w,
                        'https://images.freekaamaal.com/post_images/1612770250.png',
                        'Continental'),
                    ListTile(
                        h,
                        w,
                        'https://images.freekaamaal.com/post_images/1612770250.png',
                        'Indian'),
                  ],
                  options: CarouselOptions(
                    onPageChanged: (index, other) {},
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 1200),
                    autoPlayCurve: Curves.fastOutSlowIn,
                  )),
              Container(
                width: w / 1.2,
                margin: EdgeInsets.only(left: w / 20, right: w / 20),
                child: Text(
                  'Hi, Welcome to the app',
                  style: TextStyle(
                      fontSize: w / 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                ),
              ),
              Container(
                width: w / 1.2,
                padding: EdgeInsets.only(bottom: w / 20),
                margin: EdgeInsets.only(left: w / 20, right: w / 20),
                child: Text(
                  'Here are some trending Recipes for you...',
                  style: TextStyle(
                      fontSize: w / 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Container(
                child: Column(
                  children: [CardBuilder(), CardBuilder(), CardBuilder()],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget ListTile(double h, double w, String item, String category) {
  return ClipRRect(
    child: Column(
      children: [
        Container(
          height: h / 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(w / 5),
          ),
          width: w / 1.35,
          child: Image.network(
            item,
            fit: BoxFit.contain,
          ),
        ),
      ],
    ),
  );
}

class CardBuilder extends StatefulWidget {
  @override
  _CardBuilderState createState() => _CardBuilderState();
}

class _CardBuilderState extends State<CardBuilder> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => RecipeDetails())),
      child: Container(
        margin: EdgeInsets.only(
            top: h / 40, bottom: h / 40, left: w / 20, right: w / 20),
        height: h / 7,
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(18), //18
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20), //20
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Text(
                      'Butter Chicken',
                      style: TextStyle(
                          fontSize: 22, //22
                          color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5), // 5
                    Text(
                      'aksdfjlkasjdfkljasdlfjldsjflkjalfd',
                      style: TextStyle(color: Colors.white54),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10), //5
            Image.network(
                'https://p.kindpng.com/picc/s/151-1519867_healthy-meal-png-food-top-view-png-transparent.png')
          ],
        ),
      ),
    );
  }
}
