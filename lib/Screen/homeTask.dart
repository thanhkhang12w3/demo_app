import 'package:flutter/material.dart';

import '../model/task.dart';

class Hometask extends StatefulWidget {
  const Hometask({super.key});

  @override
  State<Hometask> createState() => _HometaskState();
}

class _HometaskState extends State<Hometask> {
  late final getData = ModalRoute.of(context)!.settings.arguments;
  int index = 0;
  bool checkBox = false;

  List<Task> tasks = [];

  void addTask(Task newTask) {
    setState(() {
      tasks.add(newTask);
    });
  }

  void checkCompleted(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
  }

  String title() {
    print("object");
    return 'Title';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        actions: const [
          Text("👆 ", style: TextStyle(fontSize: 24)),
          SizedBox(width: 12),
        ],
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return boxtask(
              tasks[index].title,
              tasks[index].description,
              tasks[index].isImportant,
              tasks[index].isCompleted,
              index,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/addtask');
          if (result != null && result is Map<String, dynamic>) {
            addTask(
              Task(
                title: result['title'],
                description: result['descrips'],
                isImportant: result['isImportant'],
              ),
            );
          }
        },
        label: const Text('Add Task'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  Container boxtask(
    String title,
    String subTitle,
    bool important,
    bool checkbox,
    int index,
  ) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.deepPurpleAccent,
      ),
      child: ListTile(
        leading: Checkbox(
          value: checkbox,
          onChanged: (value) => checkCompleted(index),
        ),
        title: Text(title),
        subtitle: Text(subTitle),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            important
                ? const Icon(Icons.star, color: Colors.yellow)
                : const Icon(Icons.star_outline),
            const SizedBox(width: 16),
            const Icon(Icons.delete),
          ],
        ),
      ),
    );
  }
}
