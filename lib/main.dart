import 'package:flutter/material.dart';
import 'package:todos_app/theme/appTheme.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todos App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      routes: {
        Home.routeName : (context)=> Home(),
      },
      initialRoute: Home.routeName,
    );
  }
}
