import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList(
      {super.key,
      required this.todoTask,
      required this.taskCompleted,
      this.onChange,
      this.deleteFunction});

  final String todoTask;
  final bool taskCompleted;
  final Function(bool?)? onChange;

  final Function(BuildContext)? deleteFunction;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
          )
        ]),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.deepPurple.shade400,
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChange,
                  checkColor: Colors.black,
                  activeColor: Colors.white,
                  side: const BorderSide(color: Colors.white),
                ),
                Text(
                  todoTask,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      decoration:
                          taskCompleted ? TextDecoration.lineThrough : null,
                      decorationColor: Colors.white),
                ),
              ],
            )),
      ),
    );
  }
}
