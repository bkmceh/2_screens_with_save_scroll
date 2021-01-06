import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:habr_scroll/home/users/selected_users.dart';

class Users extends StatefulWidget {
  final String myKey;

  Users(this.myKey);

  @override
  _Users createState() => _Users();
}

class _Users extends State<Users> {
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
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
              child: Card(
                color: SelectedUsers.userList.contains(index)
                    ? Colors.blue.withOpacity(0.3)
                    : Colors.grey.withOpacity(0.1),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Container(
                      child: Text("$index"),
                    ),
                  ),
                  title: Text("Users"),
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
}
