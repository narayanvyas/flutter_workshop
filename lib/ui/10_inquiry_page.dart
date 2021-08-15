import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop/models/inquiry_model.dart';
import 'package:flutter_workshop/services/database.dart';
import 'package:get/get.dart';

import '../global.dart';

class InquiryPage extends StatefulWidget {
  const InquiryPage({Key? key}) : super(key: key);

  @override
  _InquiryPageState createState() => _InquiryPageState();
}

class _InquiryPageState extends State<InquiryPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  bool validateForm() {
    if (nameController.text.length < 2) {
      showSnackbar('Please Enter Valid Name', Status.FAILED);
      return false;
    } else if (!GetUtils.isEmail(emailController.text)) {
      showSnackbar('Please Enter Valid Email', Status.FAILED);
      return false;
    } else if (!GetUtils.isPhoneNumber(phoneController.text) ||
        phoneController.text.length != 10) {
      showSnackbar('Please Enter Valid Phone', Status.FAILED);
      return false;
    } else if (messageController.text.length < 5) {
      showSnackbar('Please Enter Valid Message', Status.FAILED);
      return false;
    } else
      return true;
  }

  void clearForm() {
    setState(() {
      nameController.text = '';
      emailController.text = '';
      phoneController.text = '';
    });
    showSnackbar('Form Cleared Successfully', Status.SUCCESS);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    hintText: 'Name', // Placeholder
                    labelText: 'Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1))),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: 'Email', // Placeholder
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1))),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                    hintText: 'Phone Number', // Placeholder
                    labelText: 'Phone',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1))),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: messageController,
                decoration: InputDecoration(
                    hintText: 'Message', // Placeholder
                    labelText: 'Message',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1))),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: clearForm,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cancel,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Clear',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          fixedSize: MaterialStateProperty.all(Size(120, 50))),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () async {
                        if (validateForm()) {
                          InquiryModel inquiry = InquiryModel.fromMap({
                            'id': getTimeStamp(),
                            'name': nameController.text,
                            'email': emailController.text,
                            'phone': phoneController.text,
                            'message': messageController.text,
                            'createdAt': FieldValue.serverTimestamp()
                          });
                          await Database().createInquiry(inquiry);
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          fixedSize: MaterialStateProperty.all(Size(120, 50))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
