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

  bool flagAddTodo = false;

  void _addTodoList() {
    setState(() {
      flagAddTodo = !flagAddTodo;
    });
  }

  void _updateState(index) {
    var target = todo
        .firstWhere((element) => element['content'] == todo[index]['content']);
    if (target != null) {
      target["isDone"] = !target["isDone"];
    }
    setState(() {});
  }

  Widget _listTodo() {
    return ListView.builder(
        itemCount: todo.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Card(
              color: todo[index]['isDone'] ? Colors.white24 : Colors.white,
              child: ListTile(
                onTap: () => {_updateState(index)},
                leading: Checkbox(
                  value: todo[index]['isDone'],
                  onChanged: (e) => {},
                  shape: const CircleBorder(),
                ),
                title: Text(
                  todo[index]['content'],
                  style: TextStyle(
                      decoration: todo[index]['isDone']
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ),
            ),
          );
        });
  }

  Widget _createTodo() {
    return Text('Create Todo');
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
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              child: _listTodo(),
            ),
            Visibility(
                visible: flagAddTodo,
                child: GestureDetector(
                  onTap: () => {_addTodoList()},
                  child: Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black45,
                        ),
                      )),
                )),
            Visibility(
                visible: flagAddTodo,
                child: Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                        color: Colors.white,
                      ),
                      height: 500,
                      padding: const EdgeInsets.all(5.0),
                      alignment: Alignment.bottomCenter,
                      child: _createTodo(),
                    )))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {_addTodoList()},
      ),
    );
  }
}
