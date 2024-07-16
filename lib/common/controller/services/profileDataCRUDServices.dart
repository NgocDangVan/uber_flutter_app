import 'dart:convert';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rider_uber/common/controller/services/toastService.dart';
import 'package:rider_uber/common/model/profileDateModel.dart';
import 'package:rider_uber/common/view/signInLogic/signInLogin.dart';
import 'package:rider_uber/constant/constants.dart';
import 'package:rider_uber/rider/view/authScreen/loginScreen.dart';

class ProfileDataCRUDServices {
  static getProfileDataFromRealtimeDatabase(String userID) async {
    try {
      final snapShot = await realTimeDatabaseRef.child('User/$userID').get();
      if (snapShot.exists) {
        Profiledatemodel userModel = Profiledatemodel.fromMap(
            jsonDecode(jsonEncode(snapShot.value)) as Map<String, dynamic>);
        return userModel;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<bool> checkForRegisteredUser(BuildContext context) async {
    try {
      final snapShot = await realTimeDatabaseRef
          .child('User/${auth.currentUser!.phoneNumber}')
          .get();
      if (snapShot.exists) {
        log('User Data Founded');
        return true;
      } else {
        log('User Data Not Found');
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static registerUserDatabase({
    required Profiledatemodel profileData,
    required BuildContext context,
  }) {
    realTimeDatabaseRef
        // .child('User/${auth.currentUser!.phoneNumber}')
        .child('User/911234567899')
        .set(profileData.toMap())
        .then((value) {
      ToastService.sendScaffoldAlert(
        msg: 'User Registered Successfully',
        toastStatus: 'SUCCESS',
        context: context,
      );
      Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
              child: const Signinlogin(), type: PageTransitionType.rightToLeft),
          (route) => false);
    }).onError((err, stackTrace) {
      ToastService.sendScaffoldAlert(
        msg: 'Error getting Registered',
        toastStatus: 'SUCCESS',
        context: context,
      );
    });
  }

  static Future<bool> userIsDriver(BuildContext context) async {
    try {
      DataSnapshot snapshot = await realTimeDatabaseRef
          .child('User/${auth.currentUser!.phoneNumber}')
          .get();
      if (snapshot.exists) {
        Profiledatemodel userModel = Profiledatemodel.fromMap(
            jsonDecode(jsonEncode(snapshot.value)) as Map<String, dynamic>);

        log('User Type is ${userModel.userType}');
        if (userModel.userType != 'CUSTOMER') {
          return true;
        }
        return false;
      }
      return false;
    } catch (e) {
      throw Exception(e);
    }
  }
}
