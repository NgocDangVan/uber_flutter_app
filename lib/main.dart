import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rider_uber/common/view/registrationScreen/registrationScreen.dart';
import 'package:rider_uber/rider/controller/bottomNavBarRaiderProvider/bottomNavBarRaiderProvider.dart';
import 'package:rider_uber/rider/view/account/accountScreenRaider.dart';
import 'package:rider_uber/rider/view/activity/activityScreen.dart';
import 'package:rider_uber/rider/view/authScreen/loginScreen.dart';
import 'package:rider_uber/rider/view/authScreen/otpScreen.dart';
import 'package:rider_uber/rider/view/bottomNavBar/bottomNavBarRaider.dart';
import 'package:rider_uber/rider/view/homeScreen/riderHomeScreen.dart';
import 'package:rider_uber/rider/view/serviceScreen/serviceScreen.dart';
import 'package:sizer/sizer.dart';

import 'constant/utils/colors.dart';

void main() {
  runApp(const Uber());
}

class Uber extends StatefulWidget {
  const Uber({super.key});

  @override
  State<Uber> createState() => _UberState();
}

class _UberState extends State<Uber> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, _, __) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<Bottomnavbarraiderprovider>(
            create: (_) => Bottomnavbarraiderprovider(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme:
              ThemeData(appBarTheme: AppBarTheme(color: white, elevation: 0)),
          home: const Registrationscreen(),
        ),
      );
    });
  }
}
