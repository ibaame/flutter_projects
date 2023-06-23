import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/task_tile.dart';
import '../models/task_data.dart';

class TasksList extends StatelessWidget {
  final String date;
  TasksList({required this.date});
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.tasks.length,
          itemBuilder: (context, index) {
            return TaskTile(
              isChecked: taskData.tasks[index].isDone,
              taskTitle: taskData.tasks[index].name,
              checkboxChange: (newValue) {
                taskData.updateTask(taskData.tasks[index]);
                Provider.of<TaskData>(context, listen: false)
                    .saveTasksForDate(date);
              },
              listTileDelete: () {
                taskData.deleteTask(taskData.tasks[index]);
                Provider.of<TaskData>(context, listen: false)
                    .saveTasksForDate(date);
              },
            );
          },
        );
      },
    );
  }
}
