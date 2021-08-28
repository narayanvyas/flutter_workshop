import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_workshop/constants/api.dart';
import 'package:flutter_workshop/global.dart';
import 'package:flutter_workshop/models/inquiry_model.dart';
import 'package:flutter_workshop/models/weather_model.dart';
import 'package:get/get_connect.dart';

final databaseReference = FirebaseFirestore.instance;

class Database extends GetConnect {
  Future<dynamic> getWeather(String cityName) async {
    try {
      var response = await get(
          'https://api.weatherapi.com/v1/current.json?key=${Api.weatherApiKey}&q=$cityName&aqi=no');
      if (response.statusCode == 200) {
        WeatherModel weather = WeatherModel.fromMap(response.body['current']);
        return weather;
      } else if (response.statusCode == 400) {
        showSnackbar('City Not Found', Status.FAILED);
      }
    } catch (e) {
      print(e);
      showSnackbar('Error Fetching Weather', Status.FAILED);
      return false;
    }
  }

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
