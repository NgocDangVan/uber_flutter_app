import 'package:flutter/material.dart';
import 'package:rider_uber/rider/view/homeScreen/riderHomeScreen.dart';
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
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(appBarTheme: AppBarTheme(color: white, elevation: 0)),
        home: const Riderhomescreen(),
      );
    });
  }
}
