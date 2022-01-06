import 'package:firestore_withlogin/Custom%20Widgets/drawer.dart';
import 'package:firestore_withlogin/screens/CategoriesList.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  var data;
  Categories({Key key, this.data}) : super(key: key);
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  var passData = [];
  @override
  Widget build(BuildContext context) {
    print(widget.data);
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(),
        drawer: Drawers(),
        body: Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(w / 12, w / 8, w / 12, w / 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: EventTile(category: "Indian"),
                  onTap: () {
                    for (int i = 0; i < widget.data.length; i++) {
                      if (widget.data[i]['category'] == "Indian") {
                        passData.add(widget.data[i]);
                      }
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryList(
                                  data: passData,
                                  category: "Indian",
                                )));
                  },
                ),
                InkWell(
                  child: EventTile(category: "Continental"),
                  onTap: () {
                    for (int i = 0; i < widget.data.length; i++) {
                      if (widget.data[i]['category'] == "Continental") {
                        passData.add(widget.data[i]);
                      }
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryList(
                                  data: passData,
                                  category: "Continental",
                                )));
                  },
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(w / 12, 0, w / 12, w / 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: EventTile(category: "Punjabi"),
                  onTap: () {
                    for (int i = 0; i < widget.data.length; i++) {
                      if (widget.data[i]['category'] == "Punjabi") {
                        passData.add(widget.data[i]);
                      }
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryList(
                                  data: passData,
                                  category: "Punjabi",
                                )));
                  },
                ),
                InkWell(
                  child: EventTile(category: "South Indian"),
                  onTap: () {
                    for (int i = 0; i < widget.data.length; i++) {
                      if (widget.data[i]['category'] == "South Indian") {
                        passData.add(widget.data[i]);
                      }
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryList(
                                  data: passData,
                                  category: "South Indian",
                                )));
                  },
                ),
              ],
            ),
          )
        ]));
  }
}

class EventTile extends StatefulWidget {
  String category;
  EventTile({this.category});
  @override
  _EventTileState createState() => _EventTileState();
}

class _EventTileState extends State<EventTile> {
  var h, s, w;
  @override
  Widget build(BuildContext context) {
    s = MediaQuery.of(context).size;
    h = s.height;
    w = s.width;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      shadowColor: Colors.black,
      child: Container(
        width: w / 2.6,
        height: h / 6,
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.category,
              style: TextStyle(
                  fontSize: w / 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
