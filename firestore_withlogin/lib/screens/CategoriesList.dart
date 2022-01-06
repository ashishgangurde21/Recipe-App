import 'package:firestore_withlogin/screens/recipe.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  var category;
  var data;
  CategoryList({Key key, this.data, this.category}) : super(key: key);

  @override
  _CategorListState createState() => _CategorListState();
}

class _CategorListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(widget.category),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                if (widget.data.length > 0)
                  for (int i = 0; i < widget.data.length; i++)
                    Container(
                      child: CardBuilder(
                          widget.data[i].data()['Title'],
                          widget.data[i].data()['description'],
                          widget.data[i].data()['url'],
                          widget.data[i].data()['steps'],
                          widget.data[i].data()['ingredients']),
                    ),
                if (widget.data.length == 0)
                  Container(
                    child: Text('No Data'),
                  ),
              ],
            ),
          ],
        ));
  }
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
            SizedBox(width: 10), //5
            Image.network(widget.url == null
                ? 'https://p.kindpng.com/picc/s/151-1519867_healthy-meal-png-food-top-view-png-transparent.png'
                : widget.url)
          ],
        ),
      ),
    );
  }
}
