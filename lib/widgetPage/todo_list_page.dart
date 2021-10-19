import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<TodoListPage> createState() => _TodoListPage();
}

class _TodoListPage extends State<TodoListPage> {
  List<Map<String, dynamic>> todo = [
    {'content': "lau nha", 'isDone': false},
    {'content': "nau com", 'isDone': true},
    {'content': "an com", 'isDone': true},
    {'content': "rua chen", 'isDone': false},
    {'content': "quet nha", 'isDone': true},
    {'content': "di ngu", 'isDone': true},
  ];

  void _updateState(index) {
    var target = todo
        .firstWhere((element) => element['content'] == todo[index]['content']);
    if (target != null) {
      target["isDone"] = !target["isDone"];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white60,
          ),
        ),
        body: ListView.builder(
            itemCount: todo.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  child: ListTile(
                    onTap: () => {_updateState(index)},
                    leading: Checkbox(
                      value: todo[index]['isDone'],
                      onChanged: (e) => {},
                    ),
                    title: Text(todo[index]['content']),
                  ),
                ),
              );
            }));
  }
}
