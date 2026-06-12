import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  bool _isImportant = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD New Task"),
        backgroundColor: const Color.fromARGB(255, 225, 192, 252),
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 25, color: Colors.black),
        // leading: Icon(Icons.close, color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
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
              SizedBox(height: 20),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Task Title",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 78, 78, 78),
                  ),
                ),
              ),
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(
                  hintText: "Enter Task title",
                  prefixIcon: Icon(Icons.title),
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
                    borderSide: BorderSide(color: Colors.red),
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
              SizedBox(height: 20),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Description (Optional)",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 78, 78, 78),
                  ),
                ),
              ),
              TextFormField(
                maxLength: 200,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Enter Task description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.description),
                  // counterText: "0/50",
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isImportant = !_isImportant;
                  });
                },
                child: Container(
                  height: 70,
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
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
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mark as important",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          Text(
                            "This task will be highlighted",
                            style: TextStyle(
                              fontSize: 12,
                              color: const Color.fromARGB(255, 124, 124, 124),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
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
              SizedBox(height: 20),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 118, 53, 223),
                ),
                child: TextButton.icon(
                  icon: Icon(
                    Icons.save,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  onPressed: () {},
                  label: Text(
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    "Save Task",
                  ),
                ),
              ),
              SizedBox(height: 10),
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
                  icon: Icon(
                    Icons.cancel,
                    color: Color.fromARGB(255, 118, 53, 223),
                  ),
                  onPressed: () {},
                  label: Text(
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
