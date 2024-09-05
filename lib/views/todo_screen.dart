import 'package:day15_flutter_todolist_app/utils/app_styles.dart';
import 'package:day15_flutter_todolist_app/widgets/todo_item_widget.dart';
import 'package:flutter/material.dart';

import '../controllers/todo_controller.dart';
import '../widgets/add_todo_bottom_sheet.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TodoController _todoController = TodoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todo App",
          style: AppStyles.appBarTitleStyle,
        ),
        backgroundColor: AppStyles.primaryColor,
      ),
      body: ListView.builder(
        itemCount: _todoController.todos.length,
        itemBuilder: (context, index) {
          final todo = _todoController.todos[index];
          return TodoItemWidget(
            todo: todo,
            onDelete: () {
              _todoController.deleteTodo(todo);
              setState(() {});
            },
            onToggleCompleted: () {
              _todoController.toggleComplete(todo);
              setState(() {});
            },
            onUpdate: (updatedTodo) {
              _todoController.updateTodo(updatedTodo);
              setState(() {});
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (_) => AddTodoBottomSheet(
                    onAdd: (todo) {
                      setState(() {
                        _todoController.addTodo(todo);
                      });
                    },
                  ));
        },
        backgroundColor: AppStyles.primaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
