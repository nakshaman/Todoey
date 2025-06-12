import 'package:flutter/material.dart';
import 'package:todoye/widgets/add_things.dart';

class BottomRow extends StatelessWidget {
  const BottomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 20, bottom: 20, top: 3),
            child: FloatingActionButton(
              backgroundColor: Colors.lightBlueAccent,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) => AddThings(),
                );
              },
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
