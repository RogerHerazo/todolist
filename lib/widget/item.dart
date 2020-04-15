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
        child: Row(
          children: <Widget>[
            Container(
              child: _getIcon(widget.element.icon),
            ),
            Expanded(
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
              ),
            ),
          ],
        ));
  }

  Icon _getIcon(String icon) {
    switch (icon) {
      case "Default":
        return Icon(Icons.check, size: 72.0);
        break;
      case "Llamar":
        return Icon(Icons.call, size: 72.0);
        break;
      case "Work":
        return Icon(Icons.contacts, size: 72.0);
        break;
      default:
        return Icon(Icons.dialpad, size: 72.0);
    }
  }
}
