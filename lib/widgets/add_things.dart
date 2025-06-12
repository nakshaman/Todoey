import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoye/utils/data.dart';

class AddThings extends StatefulWidget {
  const AddThings({super.key});

  @override
  State<AddThings> createState() => _AddThingsState();
}

class _AddThingsState extends State<AddThings> {
  TextEditingController taskString = TextEditingController();
  bool taskView = false;
  Icon taskViewIcon = Icon(Icons.visibility_off);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 280,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Taks To Do Today',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              obscureText: taskView,
              controller: taskString,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 210, 229, 238),
                contentPadding: EdgeInsets.only(left: 10),
                hint: Text(
                  'Add Task',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 72, 71, 71),
                  ),
                  textAlign: TextAlign.left,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.lightBlueAccent,
                    width: 0.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.lightBlueAccent,
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.lightBlueAccent,
                    width: 0.5,
                  ),
                ),
                prefixIcon: Icon(Icons.task, color: Colors.lightBlue),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      taskView = !taskView;
                      if (taskView == false) {
                        taskViewIcon = Icon(Icons.visibility_off);
                      } else {
                        taskViewIcon = Icon(Icons.remove_red_eye_outlined);
                      }
                    });
                  },
                  icon: taskViewIcon,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                foregroundColor: Colors.white,
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                minimumSize: Size(double.infinity, 60),
              ),
              onPressed: () {
                final newTask = taskString.text;
                if (newTask.isNotEmpty) {
                  Provider.of<Data>(context, listen: false).add(newTask);
                  taskString.clear();
                  Navigator.pop(context);
                }
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
