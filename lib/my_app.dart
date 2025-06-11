import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoye/utils/data.dart';
import 'package:todoye/task_home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Data(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.lightBlueAccent),
        home: TaskHome(),
      ),
    );
  }
}
