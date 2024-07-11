import 'package:flutter/material.dart';

class Authprovider extends ChangeNotifier {
  String? mobileNumber;
  String? verificationCode;

  updateMobileNumber(String number) {
    mobileNumber = number;
    notifyListeners();
  }

  updateVerificationCode(String code) {
    verificationCode = code;
    notifyListeners();
  }
}
