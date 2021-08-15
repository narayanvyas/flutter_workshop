import 'package:flutter/material.dart';

class LocalImageWidget extends StatelessWidget {
  const LocalImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Local Image'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/bg_image.jpg',
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CircleAvatar(
                minRadius: 50,
                backgroundImage: AssetImage(
                  'assets/images/bg_image.jpg',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
