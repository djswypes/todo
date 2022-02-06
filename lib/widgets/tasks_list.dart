// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/models/task_data.dart';
import '../models/task.dart';
import 'tasks_tile.dart';
class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, child) {
        return ListView.builder(
            itemCount: taskData.taskCount,
            itemBuilder: (BuildContext context, int index) {
              final task = taskData.tasks;
              return Dismissible(
                key: ValueKey(task[index]),
                direction: DismissDirection.endToStart,
                onDismissed: (DismissDirection direction) {
                    taskData.deleteTask(index);
                },
                background: Container(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                        Icons.delete,
                    color: Colors.red,
                    ),
                  ),
                ),
                child: TaskTile(
                      onLongPress: () {
                        taskData.deleteTask(index);
                        },
                      taskTitle: task[index].taskName,
                      isChecked: task[index].isChecked,
                      checkBoxCallback: (checkBoxState) {
                        taskData.checkOffTask(index, checkBoxState);
                      }
                  ),
              );
            }
        );
      },
    );
    }
  }