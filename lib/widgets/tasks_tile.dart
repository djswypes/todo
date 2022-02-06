import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final void Function(bool?) checkBoxCallback;
  final VoidCallback onLongPress;
  const TaskTile({
    required this.taskTitle,
    required this.isChecked,
    required this.checkBoxCallback,
    required this.onLongPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            taskTitle,
            style:  TextStyle(
                decoration: isChecked ? TextDecoration.lineThrough : null
            ),
          ),
        ),
        Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: checkBoxCallback,
        ),
      ]
    );
  }
}

