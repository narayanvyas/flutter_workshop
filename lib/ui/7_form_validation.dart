import 'package:flutter/material.dart';
import 'package:flutter_workshop/global.dart';
import 'package:get/utils.dart';

class FormValidationWidget extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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
    } else
      return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form With Validations'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Center(child: Text('Welcome To Our App')),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      nameController.text = '';
                      emailController.text = '';
                      phoneController.text = '';
                    },
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
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        fixedSize: MaterialStateProperty.all(Size(120, 50))),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  TextButton(
                    onPressed: () {
                      if (validateForm()) {
                        showSnackbar(
                            'Thank Your ${nameController.text}, Your Email ID is ${emailController.text} & Phone Number is ${phoneController.text}',
                            Status.SUCCESS);
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
                          'Proceed',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        fixedSize: MaterialStateProperty.all(Size(120, 50))),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
