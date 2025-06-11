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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 340,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Todo',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.lightBlueAccent,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 210, 229, 238),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.lightBlueAccent, width: 0.5),
              ),
              child: TextField(
                autofocus: true,
                controller: taskString,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  hint: Text(
                    'Add Todo',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 72, 71, 71),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                foregroundColor: Colors.white,
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
