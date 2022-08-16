import 'package:flutter/material.dart';
import 'package:todos_app/screens/TodosScreen.dart';
import 'package:todos_app/screens/settingsScreen.dart';
import 'package:todos_app/smallWidgets/addNewTodo.dart';

class Home extends StatefulWidget {
  static String routeName = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> bottomNavigationBarScreens = [TodosScreen(),Settings()];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .15,
        title: const Text('To Do List'),
      ),
      body: bottomNavigationBarScreens[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 7,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onItemTap,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list),label: 'list'),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'settings')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context, builder:(context) => AddNewTodo());
        },
        child:const Icon(Icons.add,color: Colors.white)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  onItemTap(index){
    selectedIndex = index;
    setState((){});
  }
}
