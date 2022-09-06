import 'package:flutter/material.dart';

import '../model/todoModel.dart';

class TodoMission extends StatelessWidget {
  int index;
  TodoModel todoModel;

  TodoMission({required this.index, required this.todoModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 5,
            margin: const EdgeInsets.all(12),
            color: Theme.of(context).primaryColor,
          ),
          Column(
            children: [
              Text(
                todoModel.taskName,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Row(
                children: [
                  Icon(
                    Icons.timer_outlined,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${todoModel.endDate.day}/${todoModel.endDate.month}/${todoModel.endDate.year}',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 12),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: const Icon(Icons.check,color: Colors.white,))
        ],
      ),
    );
  }
}
