import 'package:flutter/material.dart';

import '../models/todo.dart';

class AddTodoBottomSheet extends StatefulWidget {
  final Function(Todo) onAdd;
  const AddTodoBottomSheet({super.key, required this.onAdd});

  @override
  State<AddTodoBottomSheet> createState() => _AddTodoBottomSheetState();
}

class _AddTodoBottomSheetState extends State<AddTodoBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
              controller: _titleController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Enter Title")),
          const SizedBox(
            height: 10,
          ),
          TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Enter Description")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Todo newTodo = Todo(
                    id: DateTime.now().toString(),
                    title: _titleController.text,
                    description: _descriptionController.text);
                widget.onAdd(newTodo);
                Navigator.pop(context);
                // Navigator.of(context).pop();
              },
              child: const Text("Add Todo"))
        ],
      ),
    );
  }
}
