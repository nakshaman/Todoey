import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoye/utils/data.dart';
import 'package:todoye/widgets/bottom_row.dart';
import 'package:todoye/widgets/product_list.dart';
import 'dart:async';

class TaskHome extends StatefulWidget {
  const TaskHome({super.key});

  @override
  State<TaskHome> createState() => _TaskHomeState();
}

class _TaskHomeState extends State<TaskHome> {
  late DateTime dateTimeNow;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    dateTimeNow = DateTime.now();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        dateTimeNow = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First Container With Icon,Todoey Text and Number of texts
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Button To delete every Task
                    GestureDetector(
                      onTap: () {
                        debugPrint('Deleted All the Tasks At Once');
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Task Deleted'),
                              content: Text('Each and Every Task is Deleted.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Provider.of<Data>(
                                      context,
                                      listen: false,
                                    ).clearAll();
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Ok',
                                    style: TextStyle(color: Colors.lightBlue),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.lightBlue),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.list,
                          color: Colors.lightBlueAccent,
                          size: 40,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white, width: 0.5),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '${dateTimeNow.day.toString().padLeft(2, '0')} : ${dateTimeNow.month.toString().padLeft(2, '0')} : ${dateTimeNow.year.toString().padLeft(2, '0')}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${dateTimeNow.hour.toString().padLeft(2, '0')} : ${dateTimeNow.minute.toString().padLeft(2, '0')} : ${dateTimeNow.second.toString().padLeft(2, '0')}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Todoey',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '${Provider.of<Data>(context).tasks.length} Tasks',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // For ListView and ListTiles
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              width: double.infinity,
              child: ProductList(),
            ),
          ),
        ],
      ),
      // For adding new tasks in the product list
      bottomNavigationBar: BottomRow(),
    );
  }
}
