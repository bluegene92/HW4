import 'package:flutter/material.dart';
import 'package:hw4/pages/new_task_page.dart';
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
          appBar: AppBar(
            title: const Text('Todo'),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          body: ListView.separated(
            itemBuilder: (_, index) => _toWidget(tasks[index]),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: tasks.length,
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () async {
                final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewTaskPage()));

                if (result != null) TaskController().insertTask(result);
              },
              child: const Icon(Icons.add, color: Colors.white)),
        );
      }),
    );
  }

  Widget _toWidget(Task task) {
    return CheckboxListTile(
        title: Text(task.description),
        value: task.isCompleted,
        onChanged: (bool? value) {
          setState(() {
            task.isCompleted = value ?? false;
          });
        });
  }
}
