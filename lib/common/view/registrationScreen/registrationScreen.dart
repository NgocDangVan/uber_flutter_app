import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rider_uber/constant/commonWidgets/elevatedButton.dart';
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
  void initState() {
    super.initState();
    mobileController.text = '+0911234567890';
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    vehicleBrandNameController.dispose();
    vehicleModeNameControlller.dispose();
    vehicleRegistrationNumberController.dispose();
    mobileController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
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
            controller: mobileController,
            title: 'Mobile Number',
            hint: '',
            readOnly: true,
            keyBoardType: TextInputType.number,
          ),
          SizedBox(
            height: 4.h,
          ),
          selectUserType('Customer'),
          SizedBox(
            height: 2.h,
          ),
          selectUserType('Partner'),
          SizedBox(
            height: 4.h,
          ),
          Builder(builder: (context) {
            if (userType == 'Partner') {
              return partner();
            } else {
              return customer();
            }
          })
        ],
      ),
    ));
  }

  selectUserType(String updateUserType) {
    return InkWell(
      onTap: () {
        if (registerButtonPressed == false) {
          setState(() {
            userType = updateUserType;
          });
        }
      },
      child: Row(
        children: [
          Container(
            height: 2.5.h,
            width: 2.5.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.sp),
                border: Border.all(
                  color: userType == updateUserType ? black : grey,
                )),
            child: Icon(
              Icons.check,
              color: userType == updateUserType ? black : grey,
              size: 2.h,
            ),
          ),
          SizedBox(
            width: 3.w,
          ),
          Text(
            'Continue as a ${updateUserType}',
            style: AppTextStyles.small10.copyWith(
              color: userType == updateUserType ? black : grey,
            ),
          ),
        ],
      ),
    );
  }

  customer() {
    return Column(
      children: [
        SizedBox(
          height: 15.h,
        ),
        ElevatedButtonCommon(
          onPressed: () {},
          backgroundColor: black,
          height: 6.h,
          width: 94.w,
          child: registerButtonPressed == true
              ? CircularProgressIndicator(
                  color: white,
                )
              : Text('Continue'),
        ),
      ],
    );
  }

  partner() {
    return Column(
      children: [
        RegistrationScreenTextField(
          controller: vehicleBrandNameController,
          title: 'Vehicle Brand Name',
          hint: '',
          readOnly: false,
          keyBoardType: TextInputType.name,
        ),
        SizedBox(
          height: 2.h,
        ),
        RegistrationScreenTextField(
          controller: vehicleModeNameControlller,
          title: 'Vehicle Model',
          hint: '',
          readOnly: false,
          keyBoardType: TextInputType.name,
        ),
        SizedBox(
          height: 2.h,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vehicle Type',
              style: AppTextStyles.body14Bold,
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 2.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8.sp,
            ),
            border: Border.all(color: grey),
          ),
          child: DropdownButton(
            isExpanded: true,
            value: selectedVehicleType,
            icon: const Icon(Icons.keyboard_arrow_down),
            underline: const SizedBox(),
            items: vehicleTypes
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: AppTextStyles.small10,
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedVehicleType = value!;
              });
            },
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        RegistrationScreenTextField(
          controller: vehicleRegistrationNumberController,
          title: 'Vehicle Registration Number',
          hint: '',
          readOnly: false,
          keyBoardType: TextInputType.name,
        ),
        SizedBox(
          height: 2.h,
        ),
        RegistrationScreenTextField(
          controller: drivingLicenseNumberController,
          title: 'Driving License No.',
          hint: '',
          readOnly: false,
          keyBoardType: TextInputType.name,
        ),
        SizedBox(
          height: 2.h,
        ),
        ElevatedButtonCommon(
          onPressed: () {},
          backgroundColor: black,
          height: 6.h,
          width: 94.w,
          child: registerButtonPressed == true
              ? CircularProgressIndicator(
                  color: white,
                )
              : Text('Continue'),
        ),
      ],
    );
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
