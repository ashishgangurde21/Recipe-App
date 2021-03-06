import 'package:carousel_slider/carousel_slider.dart';
import 'package:firestore_withlogin/Custom%20Widgets/drawer.dart';
import 'package:firestore_withlogin/screens/recipe.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// import 'signup.dart';
class HomeScreen extends StatefulWidget {
  var data;
  HomeScreen({Key key, this.data}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<QueryDocumentSnapshot> docsList = [];
  final CollectionReference ref =
      FirebaseFirestore.instance.collection('Recipes');

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    print("-----------------------------------------------");
    print(widget.data);
    print("------------------------------------------------");
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      drawer: Drawers(),
      body: ListView(
        children: [
          CarouselSlider(
              items: <Widget>[
                ListTile(h, w, 'lib/SplashscreenPic/cal1.jpg', 'Continental'),
                ListTile(h, w, 'lib/SplashscreenPic/cal2.jpg', 'Indian'),
                ListTile(h, w, 'lib/SplashscreenPic/cal3.jpg', 'Indian'),
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
              'Hi, Welcome to FoodZo',
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
          for (int i = 0; i < widget.data.length; i++)
            Container(
              child: CardBuilder(
                  widget.data[i].data()['Title'],
                  widget.data[i].data()['description'],
                  widget.data[i].data()['url'],
                  widget.data[i].data()['steps'],
                  widget.data[i].data()['ingredients']),
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
          child: Image.asset(
            item,
            fit: BoxFit.contain,
          ),
        ),
      ],
    ),
  );
}

class CardBuilder extends StatefulWidget {
  String title;
  String description;
  String url;
  String steps;
  String ingredients;

  CardBuilder(
      String s1, String s2, String url, String steps, String ingredients) {
    title = s1;
    description = s2;
    this.url = url;
    this.steps = steps;
    this.ingredients = ingredients;
  }
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
          context,
          MaterialPageRoute(
              builder: (context) => RecipeDetails(
                    title: widget.title,
                    url: widget.url,
                    description: widget.description,
                    steps: widget.steps,
                    ingredients: widget.ingredients,
                  ))),
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
                      widget.title,
                      style: TextStyle(
                          fontSize: 22, //22
                          color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5), // 5
                    Text(
                      widget.description,
                      style: TextStyle(color: Colors.white54),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 5), //5
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(w / 2),
              ),
              height: h / 8,
              width: h / 8,
              child: Image.network(
                widget.url == null
                    ? 'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg'
                    : widget.url,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 5), //5
          ],
        ),
      ),
    );
  }
}
