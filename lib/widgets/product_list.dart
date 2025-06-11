import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoye/utils/data.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool? ifChecked = true;
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Data>(context);
    return ListView.builder(
      itemCount: data.tasks.length,
      itemBuilder: (context, index) {
        final task = data.tasks[index];
        return ListTile(
          title: Text(
            task.name,
            style: TextStyle(
              decoration: task.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Checkbox(
            value: task.isDone,
            onChanged: (newValue) {
              data.toggle(index);
            },
          ),
        );
      },
    );
  }
}
