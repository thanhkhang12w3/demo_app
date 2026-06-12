import 'package:flutter/material.dart';

class Hometask extends StatefulWidget {
  const Hometask({super.key});

  @override
  State<Hometask> createState() => _HometaskState();
}

class _HometaskState extends State<Hometask> {
  late final getData = ModalRoute.of(context)!.settings.arguments;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Todo App",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        actions: [
          Text("👆 ", style: TextStyle(fontSize: 24)),
          SizedBox(width: 12),
        ],
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          // child: ListView.builder(itemBuilder: (context, index))
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Navigator.pushNamed(context, '/addtask');
        },
        label: const Text('Add Task'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  Container boxtask(String title, String subTitle, [bool check = false]) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.deepPurpleAccent,
      ),
      child: ListTile(
        leading: Checkbox(value: false, onChanged: (value) => () {}),
        title: Text(title),
        subtitle: Text(subTitle),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            check
                ? Icon(Icons.star, color: Colors.yellow)
                : Icon(Icons.star_outline),
            SizedBox(width: 16),
            Icon(Icons.delete),
          ],
        ),
      ),
    );
  }
}
