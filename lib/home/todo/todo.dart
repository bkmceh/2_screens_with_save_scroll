import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:habr_scroll/home/todo/todo_list.dart';
import 'package:habr_scroll/home/users/user_list.dart';
import 'package:http/http.dart' as http;

class ToDo extends StatefulWidget {
  final String myKey;

  ToDo(this.myKey);

  @override
  _ToDo createState() => _ToDo();
}

class _ToDo extends State<ToDo> {
  static final String url = 'https://jsonplaceholder.typicode.com/todos/';
  List<Widget> list = [
    Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        // title: Text('${TodoStore.todoData[]}'),
        subtitle: Text('This task was done'),
      ),
    ),
    Divider(),
    Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text('data'),
        subtitle: Text('This task was not done'),
      ),
    ),
    Divider(),
    Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text('data2'),
        subtitle: Text('This task was done'),
      ),
    ),
    Divider(),
    Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.yellow, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text('data'),
        subtitle: Text('This task was not done'),
      ),
    ),
  ];

  ScrollController scrollController;

  @override
  void initState() {
    scrollController = new ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          key: PageStorageKey(widget.myKey),
          controller: scrollController,
          itemCount: UserStore.userData.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpansionTile(
                  key: PageStorageKey(index),
                  title: Text("${UserStore.userData[index].name}"),
                  children: [
                    for (int i = index * 20; i < index * 20 + 20; i++)
                    Column(
                      children: [
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: TodoStore.todoData[i].completed ? Colors.green : Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            title: Text('${TodoStore.todoData[i].title}'),
                          ),
                        ),
                        if(i != index * 20 + 19)
                          Divider(),
                      ],
                    ),

                    // Container(
                    //   height: 60,
                    //   decoration: BoxDecoration(
                    //       color: Colors.red,
                    //       borderRadius: BorderRadius.circular(10)),
                    //   child: ListTile(
                    //     title: Text('data'),
                    //     subtitle: Text('This task was not done'),
                    //   ),
                    // ),
                    // Divider(),
                    // Container(
                    //   height: 60,
                    //   decoration: BoxDecoration(
                    //       color: Colors.blue,
                    //       borderRadius: BorderRadius.circular(10)),
                    //   child: ListTile(
                    //     title: Text('data2'),
                    //     subtitle: Text('This task was done'),
                    //   ),
                    // ),
                    // Divider(),
                    // Container(
                    //   height: 60,
                    //   decoration: BoxDecoration(
                    //       color: Colors.yellow,
                    //       borderRadius: BorderRadius.circular(10)),
                    //   child: ListTile(
                    //     title: Text('data'),
                    //     subtitle: Text('This task was not done'),
                    //   ),
                    // ),
                  ],
                ));
          }),
    );
  }
}
