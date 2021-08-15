import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_workshop/global.dart';
import 'package:flutter_workshop/models/inquiry_model.dart';

final databaseReference = FirebaseFirestore.instance;

class Database {
  Future<void>? createInquiry(InquiryModel contact) async {
    try {
      await databaseReference
          .collection('INQUIRIES')
          .doc(contact.id)
          .set(contact.toMap());
      showSnackbar('Inquiry Sent Successfully', Status.SUCCESS);
    } catch (e) {
      print(e);
    }
  }

  Future<InquiryModel?> getInquiry(String id) async {
    try {
      var _doc = await databaseReference.collection("INQUIRIES").doc(id).get();
      return InquiryModel.fromMap(_doc.data()!);
    } catch (e) {
      print(e);
    }
  }

  Stream<List<InquiryModel>> inquiriesStream() {
    return databaseReference
        .collection("INQUIRIES")
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> query) {
      List<InquiryModel> retVal = <InquiryModel>[];
      query.docs.forEach(
          (element) => retVal.add(InquiryModel.fromMap(element.data())));
      return retVal;
    });
  }

  Future<Status> updateInquiry(InquiryModel inquiry) async {
    try {
      await databaseReference
          .collection("INQUIRIES")
          .doc(inquiry.id)
          .update(inquiry.toMap());
      return Status.SUCCESS;
    } catch (e) {
      print(e);
      showSnackbar('Error Updating Inquiry', Status.FAILED);
      return Status.FAILED;
    }
  }

  Future<bool> deleteInquiry(String? id) async {
    try {
      await databaseReference.collection("INQUIRIES").doc(id).delete();
      showSnackbar('Inquiry Deleted Successfully', Status.SUCCESS);
      return true;
    } catch (e) {
      print(e);
      showSnackbar('Error Deleting Inquiry', Status.SUCCESS);
      return false;
    }
  }
}
