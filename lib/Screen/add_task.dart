import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  bool _isImportant = false;
  final _titleController = TextEditingController();
  final descripstionController = TextEditingController();

  void saveTask() {
    Navigator.pop(context, {
      'title': _titleController.text,
      'descrips': descripstionController.text,
      'isImportant': _isImportant,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD New Task"),
        backgroundColor: const Color.fromARGB(255, 225, 192, 252),
        centerTitle: true,
        titleTextStyle: const TextStyle(fontSize: 25, color: Colors.black),
        // leading: Icon(Icons.close, color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                  ),
                  child: Image.asset(
                    'assets/images/chicken.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  "Task Title",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 78, 78, 78),
                  ),
                ),
              ),
              TextFormField(
                controller: _titleController,
                maxLength: 50,
                decoration: InputDecoration(
                  hintText: "Enter Task title",
                  prefixIcon: const Icon(Icons.title),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Task title";
                  } else if (value.length < 3) {
                    return "Title must be at least 3 characters";
                  } else if (value.length > 50) {
                    return "Title must not exceed 50 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  "Description (Optional)",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 78, 78, 78),
                  ),
                ),
              ),
              TextFormField(
                controller: descripstionController,
                maxLength: 200,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Enter Task description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.description),
                  // counterText: "0/50",
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isImportant = !_isImportant;
                  });
                },
                child: Container(
                  height: 70,
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromARGB(255, 78, 78, 78),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _isImportant ? Icons.star : Icons.star_border,
                        color: _isImportant ? Colors.amber : Colors.grey,
                        size: 30,
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mark as important",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          Text(
                            "This task will be highlighted",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 124, 124, 124),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Switch(
                        value: _isImportant,
                        onChanged: (value) {
                          setState(() {
                            _isImportant = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 118, 53, 223),
                ),
                child: TextButton.icon(
                  icon: const Icon(
                    Icons.save,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  onPressed: saveTask,
                  label: const Text(
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    "Save Task",
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color.fromARGB(255, 78, 78, 78),
                  ),
                ),
                child: TextButton.icon(
                  icon: const Icon(
                    Icons.cancel,
                    color: Color.fromARGB(255, 118, 53, 223),
                  ),
                  onPressed: () {},
                  label: const Text(
                    style: TextStyle(color: Color.fromARGB(255, 118, 53, 223)),
                    "Cancel",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
