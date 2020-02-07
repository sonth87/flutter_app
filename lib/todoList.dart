import 'package:flutter/material.dart';
import 'package:flutter_app/addNewTodoItem.dart';
import 'package:flutter_app/models.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Todo',
      home: new TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new TodoListState();
  }
}

class TodoListState extends State<TodoList> {
  List<TodoItem> _list = [];

  _addNewTodoItem() async {
    // open add screen
    final new_task = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddNewTodoItem()));
    _saveNewItem(new_task);
  }

  _editTodoItem(i) async {
    if (_list[i] != null) {
      final edited_task = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddNewTodoItem(item: _list[i])));

      _list[i] = TodoItem(
        title: edited_task,
        completed: _list[i].completed,
      );
    }
  }

  _saveNewItem(task_name) {
    var item = TodoItem(
      title: task_name,
      completed: false,
    );

    setState(() {
      _list.add(item);
    });
  }

  _changeCompletedState(index, type) {
    if (_list[index] != null) {
      _list[index] = TodoItem(title: _list[index].title, completed: type);

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todo'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: new ListView.separated(
        itemCount: _list.length,
        itemBuilder: (context, index) {
//          return listItem(_list, index);
          return Dismissible(
            key: Key(_list[index].title),
            onDismissed: (direction) {
              setState(() {
                _list.removeAt(index);
              });

              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: new Text('item dismiss'),
                )
              );
            },
            child: listItem(_list, index),
            background: Container(
              color: Colors.red,
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
          height: 1,
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _addNewTodoItem,
        child: new Icon(Icons.add),
      ),
    );
  }

  Widget listItem(list, i) {
    return ListTile(
      title: new Text(
        list[i].title,
        style: TextStyle(
            decoration: list[i].completed == true
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            color: list[i].completed == true ? Colors.grey : Colors.black),
      ),
      subtitle: Text('description...'),
      leading: Checkbox(
        value: list[i].completed,
        onChanged: (value) {
          _changeCompletedState(i, value);
        },
      ),
      trailing: IconButton(
        icon: Icon(Icons.chevron_right),
        onPressed: () {
          _editTodoItem(i);
        },
      ),
      contentPadding: EdgeInsets.all(0),
    );
  }
}
