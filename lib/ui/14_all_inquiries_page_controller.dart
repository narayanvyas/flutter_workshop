import 'package:flutter_workshop/models/inquiry_model.dart';
import 'package:flutter_workshop/services/database.dart';
import 'package:get/get.dart';

class AllInquiriesController extends GetxController {
  RxList<InquiryModel> inquiries = <InquiryModel>[].obs;

  @override
  void onInit() {
    inquiries.bindStream(Database().inquiriesStream());
    super.onInit();
  }
}
