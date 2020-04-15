import 'package:f_202010_todo_class/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:f_202010_todo_class/widget/item.dart';
import 'package:f_202010_todo_class/widget/dropdown.dart';

class HomePageTodo extends StatefulWidget {
  @override
  _HomePageTodoState createState() => _HomePageTodoState();
}

class _HomePageTodoState extends State<HomePageTodo> {
  List<Todo> todos = new List<Todo>();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: _list(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _showDialog,
          tooltip: 'Add task',
          child: new Icon(Icons
              .add)), //_addTodo, tooltip: 'Add task', child: new Icon(Icons.add)),
    );
  }

  Widget _list() {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, posicion) {
        var element = todos[posicion];
        return _item(element, posicion);
      },
    );
  }

  Widget _item(Todo element, int posicion) {
    return ItemList(element: element);
  }

  /* void _addTodo() {
    setState(() {
      todos.add(new Todo(title: "itemT", body: "itemB", completed: 0));
    });
  } */

  void _showDialog() {
    // flutter defined function
    String dropdownValue = 'Default';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          backgroundColor: Colors.yellow[200],
          title: Text("New Todo"),
          content: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: myController1,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: myController2,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Dropdown(
                  selected: dropdownValue,
                  onChangedValue: (value) => dropdownValue = value,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
                myController1.clear();
                myController2.clear();
              },
            ),
            FlatButton(
              child: Text("Confirm"),
              onPressed: () {
                debugPrint(myController1.text +
                    " - " +
                    myController2.text +
                    " - " +
                    dropdownValue);
                setState(() {
                  todos.add(new Todo(
                      title: myController1.text,
                      body: myController2.text,
                      completed: 0,
                      icon: dropdownValue));
                });
                Navigator.of(context).pop();
                myController1.clear();
                myController2.clear();
              },
            ),
          ],
        );
      },
    );
  }
}
