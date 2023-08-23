import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
TimeOfDay stringToTimeOfDay(String tod) {
  final format = DateFormat.Hms(); //"6:00 AM"
  return TimeOfDay.fromDateTime(format.parse(tod));
}

void dismissAllAndShowError(BuildContext context, String message) {
  EasyLoading.dismiss();
  final scaffoldMessengerState = ScaffoldMessenger.of(context);
  scaffoldMessengerState.removeCurrentSnackBar();
  scaffoldMessengerState.showSnackBar(SnackBar(
      backgroundColor: Theme.of(context).errorColor,
      content: Text(
        message,
      )));
}

void showLoadingOverLay({String? message}) {
  EasyLoading.show(
    status: message ?? 'جاري التحميل',
  );
}
