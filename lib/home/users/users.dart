import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:habr_scroll/home/todo/todo_list.dart';
import 'package:habr_scroll/home/users/selected_users.dart';
import 'package:habr_scroll/home/users/user_list.dart';
import 'package:http/http.dart' as http;

class Users extends StatefulWidget {
  final String myKey;

  Users(this.myKey);

  @override
  _Users createState() => _Users();
}

class _Users extends State<Users> {
  static final String url = 'https://jsonplaceholder.typicode.com/users/';
  static final String todoUrl = 'https://jsonplaceholder.typicode.com/todos/';
  ScrollController scrollController;

  @override
  void initState() {
    parseUsersList().then((value) {
      setState(() {
        UserStore.userData = value;
      });
    });
    parseTodoList().then((value) {
      TodoStore.todoData = value;
    });
    scrollController = new ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (UserStore.userData.isEmpty) || (TodoStore.todoData.isEmpty)
          ? Center(
              child: Container(
              child: CircularProgressIndicator(
                strokeWidth: 7,
              ),
            ))
          : ListView.builder(
              key: PageStorageKey(widget.myKey),
              controller: scrollController,
              itemCount: UserStore.userData.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                  child: Card(
                    color: SelectedUsers.userList.contains(index)
                        ? Colors.blue.withOpacity(0.3)
                        : Colors.grey[300],
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Container(
                          child: Text("$index"),
                        ),
                      ),
                      title: Text("${UserStore.userData[index].name}"),
                      subtitle: Text("${UserStore.userData[index].email}"),
                      onTap: () {
                        setState(() {
                          if (SelectedUsers.userList.contains(index)) {
                            SelectedUsers.userList.remove(index);
                          } else {
                            SelectedUsers.userList.add(index);
                          }
                        });
                        print(SelectedUsers.userList);
                      },
                    ),
                  ),
                );
              }),
    );
  }

  Future<List<UserParse>> parseUsersList() async {
    final data = await http.get(url);

    List<dynamic> decodeJson = jsonDecode(data.body);

    UserParseList userParseList = UserParseList.fromMappedJson(decodeJson);

    return userParseList.userParseList;
  }

  Future<List<TodoElement>> parseTodoList() async {
    final data = await http.get(todoUrl);

    List<dynamic> decodeJson = jsonDecode(data.body);
    // print(data.body);

    TodoList todoList = TodoList.fromMappedJson(decodeJson);

    return todoList.todoList;
  }
}
