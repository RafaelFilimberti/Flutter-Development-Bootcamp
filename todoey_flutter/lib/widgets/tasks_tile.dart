import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  late final bool isChecked;
  late final String taskTille;
  final ValueChanged<bool?> checkboxCallback;
  final VoidCallback longPressCallback;

  TaskTile({
    required this.taskTille,
    required this.isChecked,
    required this.checkboxCallback,
    required this.longPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
          taskTille,
        style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      );
  }
}




