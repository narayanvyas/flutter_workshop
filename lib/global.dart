import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum Status {
  FAILED,
  SUCCESS,
  WAITING,
}

showSnackbar(String message, Status status) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: status == Status.SUCCESS
        ? Colors.green
        : status == Status.FAILED
            ? Colors.red
            : Colors.blue,
    webBgColor: status == Status.SUCCESS
        ? '#22C316'
        : status == Status.FAILED
            ? '#E11C1C'
            : '#40C2F3',
    textColor: Colors.white,
  );
}

String getTimeStamp() {
  final currentTime = DateTime.now();
  final String timeStamp =
      '${currentTime.day}${currentTime.month}${currentTime.year}${currentTime.hour}${currentTime.minute}${currentTime.second}${currentTime.microsecond}';
  return timeStamp;
}
