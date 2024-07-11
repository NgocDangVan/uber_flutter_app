import 'package:flutter/material.dart';
import 'package:rider_uber/common/controller/services/mobileAuthServices.dart';
import 'package:rider_uber/constant/utils/colors.dart';

class Signinlogin extends StatefulWidget {
  const Signinlogin({super.key});

  @override
  State<Signinlogin> createState() => _SigninloginState();
}

class _SigninloginState extends State<Signinlogin> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Mobileauthservices.checkAuthenticationAndNavigate(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: const Center(
        child: Image(
          image: AssetImage('assets/images/uberLogo/uber.png'),
        ),
      ),
    );
  }
}
