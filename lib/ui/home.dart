import 'package:flutter/material.dart';
import 'package:flutter_workshop/ui/9_NavigationDrawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SSN Institute'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.jpg'),
            SizedBox(
              height: 30,
            ),
            Text(
              'Welcome To Flutter Workshop',
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
