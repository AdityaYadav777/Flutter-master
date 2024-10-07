// ignore: file_names
import 'package:flutter/material.dart';
import 'package:myapp/utils/todoList.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List todo = [
    ['Hii i am android developer', false],
    ['Hello i am full stack developer', false],
    ['i am Aditya All Rounder Coader', false]
  ];

  void checkBoxChange(int index) {
    setState(() {
      todo[index][1] = !todo[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      todo.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      todo.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple.shade300,
        appBar: AppBar(
          title: const Text('Aditya Tasks'),
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple,
        ),
        body: ListView.builder(
            itemCount: todo.length,
            itemBuilder: (BuildContext context, index) {
              return TodoList(
                todoTask: todo[index][0],
                taskCompleted: todo[index][1],
                onChange: (value) => checkBoxChange(index),
                deleteFunction: (context) => deleteTask(index),
              );
            }),
        floatingActionButton: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.deepPurple,
                  hintText: 'Add New Task',
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            )),
            FloatingActionButton(
              onPressed: saveNewTask,
              child: const Icon(Icons.add),
            ),
          ],
        ));
  }
}
