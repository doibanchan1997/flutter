import 'package:flutter/material.dart';

import './todo_list_page.dart';
import './home_page.dart';

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({Key? key}) : super(key: key);

  @override
  State<NavigationBottom> createState() => _NavigationBottom();
}

class _NavigationBottom extends State<NavigationBottom> {
  int _itemIdex = 0;

  void _onTapItem(index) => {
        setState(() {
          _itemIdex = index;
        })
      };

  static List<Widget> _widgetOptions = <Widget>[
    MyHomePage(title: 'Flutter Todo List'),
    TodoListPage(title: 'Flutter Todo List'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: _widgetOptions.elementAt(_itemIdex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Todo",
              backgroundColor: Colors.blue)
        ],
        currentIndex: _itemIdex,
        onTap: _onTapItem,
      ),
    );
  }
}
