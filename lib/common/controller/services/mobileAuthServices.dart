import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rider_uber/common/controller/services/profileDataCRUDServices.dart';
import 'package:rider_uber/common/view/registrationScreen/registrationScreen.dart';
import 'package:rider_uber/common/view/signInLogic/signInLogin.dart';
import 'package:rider_uber/constant/constants.dart';
import 'package:rider_uber/driver/view/driverHomeScreen.dart';
import 'package:rider_uber/rider/view/authScreen/loginScreen.dart';
import 'package:rider_uber/rider/view/authScreen/otpScreen.dart';
import 'package:rider_uber/rider/view/bottomNavBar/bottomNavBarRaider.dart';

import '../authProvider.dart';

class Mobileauthservices {
  static receiveOTP({
    required BuildContext context,
    required String mobileNumber,
  }) {
    try {
      // await auth.verifyPhoneNumber(
      //   phoneNumber: mobileNumber,
      //   verificationCompleted: (PhoneAuthCredential credential) {
      //     log(credential.toString());
      //   },
      //   verificationFailed: (FirebaseAuthException exception) {
      //     log(exception.toString());
      //   },
      //   codeSent: (String verificationCode, int? resendToken) {
      //     context.read<Authprovider>().updateVerificationCode(verificationCode);
      //     Navigator.push(
      //       context,
      //       PageTransition(
      //         child: const Otpscreen(),
      //         type: PageTransitionType.rightToLeft,
      //       ),
      //     );
      //   },
      //   codeAutoRetrievalTimeout: (String verificationID) {},
      // );

      Navigator.push(
        context,
        PageTransition(
          child: const Otpscreen(),
          type: PageTransitionType.rightToLeft,
        ),
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  static verifyOTP({
    required BuildContext context,
    required String otp,
  }) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: context.read<Authprovider>().verificationCode!,
        smsCode: otp,
      );
      await auth.signInWithCredential(credential);
      Navigator.push(
        context,
        PageTransition(
          child: const Signinlogin(),
          type: PageTransitionType.rightToLeft,
        ),
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  static bool checkAuthentication() {
    User? user = auth.currentUser;
    if (user != null) {
      return true;
    }
    return false;
  }

  static checkAuthenticationAndNavigate({required BuildContext context}) {
    bool userIsAuthenticated = checkAuthentication();
    userIsAuthenticated
        ? checkUser(context)
        : Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
              child: Bottomnavbarraider(),
              type: PageTransitionType.rightToLeft,
            ),
            (route) => false,
          );
  }

  static checkUser(BuildContext context) async {
    bool userIsRegistered =
        await ProfileDataCRUDServices.checkForRegisteredUser(context);
    if (userIsRegistered == true) {
      bool userIsDriver = await ProfileDataCRUDServices.userIsDriver(context);
      if (userIsDriver == true) {
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
              child: const HomeScreenDriver(),
              type: PageTransitionType.rightToLeft,
            ),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
              child: const Bottomnavbarraider(),
              type: PageTransitionType.rightToLeft,
            ),
            (route) => false);
      }
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
            child: const Registrationscreen(),
            type: PageTransitionType.rightToLeft,
          ),
          (route) => false);
    }
  }
}
