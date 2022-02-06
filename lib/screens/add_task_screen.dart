// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/models/task_data.dart';

// ignore: must_be_immutable
class AddTaskScreen extends StatelessWidget {

final TextEditingController _taskController = TextEditingController();

   AddTaskScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              onSubmitted: (value){
                if(_taskController.text.isEmpty) return;
                Provider.of<TaskData>(context, listen: false).addTask(_taskController.text);
                Navigator.pop(context);
              },
              controller: _taskController ,
              keyboardType: TextInputType.text,
             textCapitalization: TextCapitalization.sentences,

              autofocus: true,
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent)
              ),
              onPressed: () {
                if(_taskController.text.isEmpty) return;
                Provider.of<TaskData>(context, listen: false).addTask(_taskController.text);
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Add',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
