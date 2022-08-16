import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AddNewTodo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Add Task',style: Theme.of(context).textTheme.displayLarge,textAlign: TextAlign.center),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Please Add New Task',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Add description To task',
            ),
            maxLines: 3,
          ),
          Text('Select Dead Line Date',style: Theme.of(context).textTheme.displayMedium,textAlign: TextAlign.left),
          InkWell(
              onTap: (){
                /// Open Calendar
              },
              child: Text('20/12/2022',style: Theme.of(context).textTheme.displayMedium,textAlign: TextAlign.center)),
          ElevatedButton(onPressed: (){Navigator.pop(context);}, child: const Icon(Icons.check))

        ],
      ),
    );
  }
}
