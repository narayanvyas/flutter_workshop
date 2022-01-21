import 'package:flutter/material.dart';
import 'package:flutter_workshop/models/inquiry_model.dart';
import 'package:flutter_workshop/services/database.dart';
import 'package:flutter_workshop/ui/14_all_inquiries_page_controller.dart';
import 'package:get/get.dart';

class AllInquiriesWithGet extends StatelessWidget {
  final controller = Get.put(AllInquiriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Inquiries'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
        child: Obx(() => ListView.builder(
            itemCount: controller.inquiries.length,
            itemBuilder: (context, index) =>
                InquiryCard(inquiry: controller.inquiries[index]))),
      ),
    );
  }
}

class InquiryCard extends StatelessWidget {
  final InquiryModel inquiry;
  InquiryCard({required this.inquiry});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.person_outline, color: Colors.blue),
      trailing: IconButton(
        icon: Icon(
          Icons.cancel,
          color: Colors.deepPurple,
        ),
        onPressed: () async {
          await Database().deleteInquiry(inquiry.id);
        },
      ),
      title: Text(inquiry.name ?? ''),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(inquiry.email ?? ''),
          Text(inquiry.phone ?? ''),
          Text(inquiry.message ?? ''),
        ],
      ),
    ));
  }
}
