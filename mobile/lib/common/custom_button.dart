import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project1/common/app_style.dart';
import 'package:graduation_project1/common/reusable_text.dart';
import 'package:graduation_project1/constants/constants.dart';

//place or add to cart
class CustomButton extends StatelessWidget {
<<<<<<< HEAD
  const CustomButton(
      {super.key,
      this.onTap,
      this.btnWidth,
      this.btnHeight,
      this.btnColor,
      this.radius,
      required this.text,
      this.textcolor,
      this.borderColor});
=======
  const CustomButton({
    super.key,
    this.onTap,
    this.btnWidth,
    this.btnHeight,
    this.btnColor,
    this.radius,
    required this.text,
    this.textcolor,
    this.borderColor,
    this.child, // ✅ Add child parameter
  });
>>>>>>> clean-branch

  final void Function()? onTap;
  final double? btnWidth;
  final double? btnHeight;
  final Color? btnColor;
  final Color? textcolor;
  final Color? borderColor;
<<<<<<< HEAD

  final double? radius;
  final String text;
=======
  final double? radius;
  final String text;
  final Widget? child; // ✅ Add this
>>>>>>> clean-branch

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: btnWidth ?? width,
        height: btnHeight ?? 28.h,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? kLightBlue),
          color: btnColor ?? kBlue,
<<<<<<< HEAD
          borderRadius: BorderRadius.circular(
            radius ?? 12.r,
          ),
        ),
        child: Center(
          child: ReusableText(
              text: text,
              style: appStyle(16, textcolor ?? kLightBlue, FontWeight.w500)),
=======
          borderRadius: BorderRadius.circular(radius ?? 12.r),
        ),
        child: Center(
          child: child ?? // ✅ Use child if provided
              ReusableText(
                text: text,
                style: appStyle(16, textcolor ?? kLightBlue, FontWeight.w500),
              ),
>>>>>>> clean-branch
        ),
      ),
    );
  }
}
