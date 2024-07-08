import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Elevatedbuttoncommon extends StatefulWidget {
  Elevatedbuttoncommon(
      {super.key,
      required this.child,
      required this.onPressed,
      required this.backgroundColor,
      required this.height,
      required this.width,
      required this.borderRadius});

  final VoidCallback onPressed;
  final Widget child;
  final Color backgroundColor;
  final double height;
  final double width;
  double? borderRadius;

  @override
  State<Elevatedbuttoncommon> createState() => _ElevatedbuttoncommonState();
}

class _ElevatedbuttoncommonState extends State<Elevatedbuttoncommon> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.backgroundColor,
        minimumSize: Size(
          widget.width,
          widget.height,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            widget.borderRadius ?? 6.sp,
          ),
        ),
      ),
      child: widget.child,
    );
  }
}
