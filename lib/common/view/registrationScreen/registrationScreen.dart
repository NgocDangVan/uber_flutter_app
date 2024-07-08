import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rider_uber/constant/utils/colors.dart';
import 'package:rider_uber/constant/utils/textStyles.dart';
import 'package:sizer/sizer.dart';

class Registrationscreen extends StatefulWidget {
  const Registrationscreen({super.key});

  @override
  State<Registrationscreen> createState() => _RegistrationscreenState();
}

class _RegistrationscreenState extends State<Registrationscreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController vehicleModeNameControlller = TextEditingController();
  TextEditingController vehicleBrandNameController = TextEditingController();
  TextEditingController vehicleRegistrationNumberController =
      TextEditingController();
  TextEditingController drivingLicenseNumberController =
      TextEditingController();

  String selectedVehicleType = 'Selected Vehicle Type';

  List<String> vehicleTypes = [
    'Selected Vehicle Type',
    'Mini',
    'Sedan',
    'SUV',
    'Bike'
  ];

  String userType = 'Customer';
  File? profilePic;
  bool registerButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 3.w,
          vertical: 2.h,
        ),
        children: [
          SizedBox(
            height: 2.h,
          ),
          InkWell(
            onTap: () {},
            child: CircleAvatar(
              radius: 8.h,
              backgroundColor: greyShade3,
              child: Padding(
                padding: EdgeInsets.all(2),
                child: Builder(
                  builder: (context) {
                    if (profilePic != null) {
                      return CircleAvatar(
                        radius: 8.h - 2,
                        backgroundColor: white,
                        backgroundImage: FileImage(profilePic!),
                      );
                    } else {
                      return CircleAvatar(
                        radius: 8.h - 2,
                        backgroundColor: white,
                        child: const Image(
                          image: AssetImage(
                            'assets/images/uberLogo/uberLogoBlack.png',
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          RegistrationScreenTextField(
            controller: nameController,
            title: 'Name',
            hint: '',
            readOnly: false,
            keyBoardType: TextInputType.name,
          ),
          SizedBox(
            height: 2.h,
          ),
          RegistrationScreenTextField(
            controller: emailController,
            title: 'Email',
            hint: '',
            readOnly: false,
            keyBoardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 2.h,
          ),
          RegistrationScreenTextField(
            controller: nameController,
            title: 'Mobile Number',
            hint: '',
            readOnly: true,
            keyBoardType: TextInputType.number,
          ),
        ],
      ),
    ));
  }
}

class RegistrationScreenTextField extends StatefulWidget {
  const RegistrationScreenTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.hint,
    required this.readOnly,
    required this.keyBoardType,
  });
  final TextEditingController controller;
  final String title;
  final String hint;
  final bool readOnly;
  final TextInputType keyBoardType;
  @override
  State<RegistrationScreenTextField> createState() =>
      _RegistrationScreenTextFieldState();
}

class _RegistrationScreenTextFieldState
    extends State<RegistrationScreenTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppTextStyles.body14Bold,
        ),
        SizedBox(
          height: 1.h,
        ),
        TextFormField(
          controller: widget.controller,
          cursorColor: black,
          style: AppTextStyles.textFieldTextStyle,
          keyboardType: widget.keyBoardType,
          readOnly: widget.readOnly,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 2.w,
            ),
            hintText: widget.hint,
            hintStyle: AppTextStyles.textFieldHintTextStyle,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: black),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
