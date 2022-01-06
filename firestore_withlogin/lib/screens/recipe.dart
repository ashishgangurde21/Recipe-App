import 'package:flutter/material.dart';

class RecipeDetails extends StatefulWidget {
  var title;
  var url;
  var ingredients;
  var description;
  var steps;

  RecipeDetails(
      {Key key,
      this.title,
      this.url,
      this.ingredients,
      this.description,
      this.steps})
      : super(key: key);
  @override
  _RecipeDetailsState createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  @override
  Widget build(BuildContext context) {
    print(widget.title);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 120.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white,
                ),
                child: Text(
                  widget.title,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              background: Image.network(
                widget.url,
                fit: BoxFit.cover,
              ),
            ),
            actions: <Widget>[
              IconButton(onPressed: () {}, icon: Icon(Icons.share)),
            ],
          ),
          Recipe(widget.description, widget.ingredients, widget.steps),
        ],
      ),
    );
  }
}

Widget Recipe(String description, String ingredients, String steps) =>
    SliverToBoxAdapter(
      child: Column(
        children: [
          Card(
            color: Colors.green,
            child: ListTile(
              title: Text(
                "Description:",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              subtitle: Text(
                description,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            elevation: 8,
            shadowColor: Colors.black,
            margin: EdgeInsets.all(20),
          ),
          Card(
            color: Colors.redAccent,
            child: ListTile(
              horizontalTitleGap: 15,
              title: Text(
                "Ingredients:",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              subtitle: Text(
                ingredients,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            elevation: 8,
            shadowColor: Colors.black,
            margin: EdgeInsets.all(20),
          ),
          Card(
            color: Colors.blue,
            child: ListTile(
              horizontalTitleGap: 15,
              title: Text(
                "Steps:",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              subtitle: Text(
                steps,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            elevation: 8,
            shadowColor: Colors.black,
            margin: EdgeInsets.all(20),
          )
        ],
      ),
    );
