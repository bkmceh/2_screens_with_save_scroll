import 'package:flutter/material.dart';
import 'package:habr_scroll/home/users/selected_users.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Список выбранных пользователей"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: SelectedUsers.userList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
              child: Card(
                color: Colors.blue.withOpacity(0.2),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Container(
                      child: Text("${SelectedUsers.userList[index]}"),
                    ),
                  ),
                  title: Text("Users"),
                ),
              ),
            );
          }),
    );
  }
}