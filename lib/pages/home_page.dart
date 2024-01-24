import 'package:flutter/material.dart';

import '../controllers/task_controller.dart';
import '../model/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _stream = TaskController().getStream();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Task>>(
      stream: _stream,
      builder: ((context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(title: const Text('Todo')),
            body: const CircularProgressIndicator(),
          );
        }

        final tasks = snapshot.data ?? [];
        return Scaffold(
          appBar: AppBar(title: const Text('Todo')),
          body: ListView.separated(
            itemBuilder: (_, index) => _toWidget(tasks[index]),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: tasks.length,
          ),
        );
      }),
    );
  }

  Widget _toWidget(Task task) {
    return const Placeholder();
  }
}
