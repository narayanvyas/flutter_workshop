import 'package:flutter/material.dart';
import 'package:flutter_workshop/ui/10_inquiry_page.dart';
import 'package:flutter_workshop/ui/11_all_inquiries_page.dart';
import 'package:flutter_workshop/ui/12_pick_image.dart';
import 'package:flutter_workshop/ui/1_HelloWorld.dart';
import 'package:flutter_workshop/ui/2_RowWidget.dart';
import 'package:flutter_workshop/ui/3_ColumnWidget.dart';
import 'package:flutter_workshop/ui/4_LocalImageWidget.dart';
import 'package:flutter_workshop/ui/5_ImageFromNetworkWidget.dart';
import 'package:flutter_workshop/ui/6_form.dart';
import 'package:flutter_workshop/ui/7_form_validation.dart';
import 'package:flutter_workshop/ui/8_form_with_state_management.dart';
import 'package:get/get.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/bg_image.jpg'),
                  ),
                ),
                Text(
                  'Hello!',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          ListTile(
            title: Text('Hello World'),
            onTap: () {
              Get.to(() => HelloWorld());
            },
          ),
          ListTile(
            title: Text('Rows'),
            onTap: () {
              Get.to(() => RowWidget());
            },
          ),
          ListTile(
            title: Text('Columns'),
            onTap: () {
              Get.to(() => ColumnWidget());
            },
          ),
          ListTile(
            title: Text('Local Image'),
            onTap: () {
              Get.to(() => LocalImageWidget());
            },
          ),
          ListTile(
            title: Text('Network Image'),
            onTap: () {
              Get.to(() => ImageFromNetworkWidget());
            },
          ),
          ListTile(
            title: Text('Simple Form'),
            onTap: () {
              Get.to(() => FormWidget());
            },
          ),
          ListTile(
            title: Text('Form With Validations'),
            onTap: () {
              Get.to(() => FormValidationWidget());
            },
          ),
          ListTile(
            title: Text('Form With State'),
            onTap: () {
              Get.to(() => FormWithStateWidget());
            },
          ),
          ListTile(
            title: Text('Contact Us'),
            onTap: () {
              Get.to(() => InquiryPage());
            },
          ),
          ListTile(
            title: Text('All Inquiries'),
            onTap: () {
              Get.to(() => AllInquiries());
            },
          ),
          ListTile(
            title: Text('Pick Image'),
            onTap: () {
              Get.to(() => PickImage());
            },
          ),
        ],
      ),
    );
  }
}
