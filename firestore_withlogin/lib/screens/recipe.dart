import 'package:flutter/material.dart';

class RecipeDetails extends StatefulWidget {
  @override
  _RecipeDetailsState createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Details'),
      ),
      body: Center(
        child: Text('Recipe Details'),
      ),
    );
  }
}
