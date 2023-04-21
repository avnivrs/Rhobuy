import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_naverda/controller/login_controller.dart';
import 'package:project_naverda/controller/signup_controller.dart';

import '../styles/color.dart';

sizedBoxHeight(double height) => SizedBox(
      height: height.h,
    );

sizedBoxWidth(double width) => SizedBox(
      width: width.w,
    );
final symmetricPadding =
    EdgeInsets.only(left: 20.spMax, right: 20.spMax, top: 20.spMax);

buildBorderRadius(double radius) => BorderRadius.circular(radius.r);

walkthroughCircle(Color color, IconData iconData) {
  return Container(
    width: 90.w,
    height: 120.h,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    child: Icon(
      iconData,
      size: 30.sp,
      color: kBgColor,
    ),
  );
}

walkthroughPills(Color color) {
  return Container(
    width: 95.w,
    height: Get.mediaQuery.size.height * 0.4 - 50.h,
    decoration: BoxDecoration(
      borderRadius: buildBorderRadius(100),
      color: color,
    ),
  );
}

copyDateWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.copyright, size: 18.sp, color: kGreyColor),
      sizedBoxWidth(5),
      Text(
        '${DateTime.now().year} Rhobuy from Avniverse, Inc.',
        style: TextStyle(fontSize: 12.sp, color: kGreyColor),
      ),
    ],
  );
}

inputConponent(Color color) {
  return OutlineInputBorder(
      borderRadius: buildBorderRadius(40),
      borderSide: BorderSide(color: color, width: 0));
}

InputDecoration buildInputDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    isCollapsed: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
    filled: true,
    fillColor: kInputBgColor,
    border: inputConponent(kInputBgColor),
    enabledBorder: inputConponent(kInputBgColor),
    focusedBorder: inputConponent(kGreyColor),
    errorBorder: inputConponent(Colors.red.withOpacity(0.3)),
  );
}

InputDecoration buildInputDecorationII(String hintText) {
  return InputDecoration(
    hintText: hintText,
    isCollapsed: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
    filled: true,
    fillColor: kInputBgColor,
    suffixIcon: GestureDetector(
        onTap: () {
          Get.find<SignUpController>().toggleObscureText();
        },
        child: Icon(
          Get.find<SignUpController>().passwordObscureText.value
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: kGreyColor,
        )),
    border: inputConponent(kInputBgColor),
    enabledBorder: inputConponent(kInputBgColor),
    focusedBorder: inputConponent(kGreyColor),
    errorBorder: inputConponent(Colors.red.withOpacity(0.3)),
  );
}

InputDecoration buildInputDecorationIV(String hintText) {
  return InputDecoration(
    hintText: hintText,
    isCollapsed: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
    filled: true,
    fillColor: kInputBgColor,
    suffixIcon: GestureDetector(
        onTap: () {
          Get.find<LoginController>().toggleObscureText();
        },
        child: Icon(
          Get.find<LoginController>().obscureText.value
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: kGreyColor,
        )),
    border: inputConponent(kInputBgColor),
    enabledBorder: inputConponent(kInputBgColor),
    focusedBorder: inputConponent(kGreyColor),
    errorBorder: inputConponent(Colors.red.withOpacity(0.3)),
  );
}

InputDecoration buildInputDecorationIII(String hintText) {
  return InputDecoration(
    hintText: hintText,
    isCollapsed: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
    filled: true,
    fillColor: kInputBgColor,
    suffixIcon: hintText == 'Email address' || hintText == 'Name'
        ? null
        : GestureDetector(
            onTap: () {
              Get.find<SignUpController>().toggleConfirmObscureText();
            },
            child: Icon(
              Get.find<SignUpController>().confirmPasswordObscureText.value
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: kGreyColor,
            )),
    border: inputConponent(kInputBgColor),
    enabledBorder: inputConponent(kInputBgColor),
    focusedBorder: inputConponent(kGreyColor),
    errorBorder: inputConponent(Colors.red.withOpacity(0.3)),
  );
}

Row backButton() {
  return Row(
    children: [
      InkWell(
        onTap: () => Get.back(),
        child: Container(
          padding: EdgeInsets.all(8.sp),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.grey.withOpacity(0.3)),
          child: Center(
            child: Icon(
              CupertinoIcons.left_chevron,
              size: 20.sp,
            ),
          ),
        ),
      )
    ],
  );
}

Text buildHeader(String header) {
  return Text(
    header,
    style: TextStyle(fontSize: 21.sp, fontWeight: FontWeight.w600),
  );
}

buildHeaderDes(String des) {
  return Text(
    des,
    style: TextStyle(fontSize: 15.sp, color: kGreyColor),
  );
}
buildAuthButton(String buttonText, VoidCallback press) {
  return InkWell(
    onTap: press,
    child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 70.h,
        decoration: BoxDecoration(
            color: kGreyColor, borderRadius: buildBorderRadius(20)),
        child:  Text(
          buttonText,
          style: TextStyle(color: Colors.white,fontSize: 16.sp, fontWeight: FontWeight.w600),
        )),
  );
}
