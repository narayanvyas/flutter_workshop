import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class PickImage extends StatefulWidget {
  const PickImage({Key? key}) : super(key: key);

  @override
  _PickImageState createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  final ImagePicker _picker = ImagePicker();
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Image'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageFile == null)
              Container(
                height: 300,
                width: Get.width,
                child: Icon(
                  Icons.image_outlined,
                  size: 70,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
              ),
            if (imageFile != null) Image.file(imageFile!),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black)),
                        onPressed: () async {
                          XFile? file = await _picker.pickImage(
                              source: ImageSource.gallery);

                          if (file != null) {
                            setState(() {
                              imageFile = File(file.path);
                            });
                          }
                        },
                        child: Text(
                          'Pick Image',
                          style: TextStyle(color: Colors.white),
                        ))),
                if (imageFile != null)
                  SizedBox(
                    width: 30,
                  ),
                if (imageFile != null)
                  Expanded(
                      child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black)),
                          onPressed: () {
                            setState(() {
                              imageFile = null;
                            });
                          },
                          child: Text(
                            'Clear Image',
                            style: TextStyle(color: Colors.white),
                          )))
              ],
            )
          ],
        ).paddingSymmetric(horizontal: 30),
      ),
    );
  }
}
