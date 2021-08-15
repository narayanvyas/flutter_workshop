import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column Example'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 50,
              height: 150,
              color: Colors.orange,
            ),
            Container(
              width: 60,
              height: 50,
              color: Colors.blue,
            ),
            Container(
              width: 40,
              height: 90,
              color: Colors.red,
            ),
            Container(
              width: 70,
              height: 120,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
