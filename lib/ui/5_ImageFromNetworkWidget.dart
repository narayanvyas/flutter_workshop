import 'package:flutter/material.dart';

class ImageFromNetworkWidget extends StatelessWidget {
  const ImageFromNetworkWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Local Image'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://cdn.pixabay.com/photo/2021/07/11/10/39/fantasy-6403406_1280.jpg',
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              minRadius: 50,
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2021/07/11/10/39/fantasy-6403406_1280.jpg',
              ),
            )
          ],
        ),
      ),
    );
  }
}
