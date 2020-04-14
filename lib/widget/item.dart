import 'package:flutter/material.dart';
import 'package:f_202010_todo_class/model/todo.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key key, this.title, this.element}) : super(key: key);

  final String title;
  final Todo element;
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow[200],
        margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        padding: const EdgeInsets.all(5.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.element.title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            Text(widget.element.body,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 10)),
          ],
        ));
  }
}
