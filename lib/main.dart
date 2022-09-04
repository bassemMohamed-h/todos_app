import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_app/providers/todoControllerProvider.dart';
import 'package:todos_app/theme/appTheme.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoControllerProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        routes: {Home.routeName: (_) => Home()},
        initialRoute: Home.routeName,
      ),
    );
  }
}