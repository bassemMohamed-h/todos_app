import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height *.15,
        title: const Text('To Do List'),
      ),
      body: Text('body'),
    );
  }
}
