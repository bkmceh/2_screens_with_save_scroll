import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ToDo extends StatefulWidget {
  final String myKey;

  ToDo(this.myKey);

  @override
  _ToDo createState() => _ToDo();
}

class _ToDo extends State<ToDo> {
  List<Widget> list = [
    Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text('data2'),
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
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpansionTile(
                  key: PageStorageKey(index),
                  title: Text("$index"),
                  children: list,
                ));
          }),
    );
  }
}