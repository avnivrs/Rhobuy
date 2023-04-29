import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_naverda/controller/login_controller.dart';
import 'package:project_naverda/controller/signup_controller.dart';

import '../styles/color.dart';
import '../styles/constants.dart';

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
      size: 24.sp,
      color: kBgColor,
    ),
  );
}

walkthroughPills(Color color, String imageAsset) {
  return Container(
    width: 95.w,
    height: Get.mediaQuery.size.height * 0.4 - 60.h,
    decoration: BoxDecoration(
        borderRadius: buildBorderRadius(100),
        color: color,
        image: DecorationImage(
            image: AssetImage(imgUrl + imageAsset), fit: BoxFit.cover)),
  );
}

copyDateWidget() {
  return Padding(
    padding: EdgeInsets.only(bottom: 20.sp),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        sizedBoxWidth(5),
        Text(
          '  © ${DateTime.now().year}. Rhobuy from Avniverse, Inc..',
          style: TextStyle(
              fontSize: 11.sp, fontWeight: FontWeight.w500, color: kGreyColor),
        ),
      ],
    ),
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
    hintStyle: TextStyle(
        fontSize: 11.sp, fontWeight: FontWeight.w600, color: kGreyColor),
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

InputDecoration buildInputDecorationLogin(String hintText) {
  return InputDecoration(
    hintText: hintText,
    isCollapsed: true,
    hintStyle: TextStyle(
        fontSize: 11.sp, fontWeight: FontWeight.w600, color: kGreyColor),
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20.h),
    filled: true,
    fillColor: kInputBgColor,
    suffix: GestureDetector(
        onTap: () {
          Get.find<LoginController>().toggleObscureText();
        },
        child: Icon(
          Get.find<LoginController>().obscureText.value
              ? Iconsax.eye
              : Iconsax.eye_slash,
          size: 18.sp,
          color: kGreyColor,
        )),
    border: inputConponent(kInputBgColor),
    enabledBorder: inputConponent(kInputBgColor),
    focusedBorder: inputConponent(kGreyColor),
    errorBorder: inputConponent(Colors.red.withOpacity(0.3)),
  );
}

InputDecoration buildInputDecorationII(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
        fontSize: 11.sp, fontWeight: FontWeight.w600, color: kGreyColor),
    isCollapsed: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
    filled: true,
    fillColor: kInputBgColor,
    suffix: GestureDetector(
        onTap: () {
          hintText != 'Confirm password'
              ? Get.find<SignUpController>().toggleObscureText()
              : Get.find<SignUpController>().toggleConfirmObscureText();
        },
        child: Icon(
          hintText != 'Confirm password'
              ? Get.find<SignUpController>().passwordObscureText.value
                  ? Iconsax.eye
                  : Iconsax.eye_slash
              : Get.find<SignUpController>().confirmPasswordObscureText.value
                  ? Iconsax.eye
                  : Iconsax.eye_slash,
          color: kGreyColor,
          size: 18.sp,
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
          padding: EdgeInsets.all(10.sp),
          alignment: Alignment.center,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: kGreyColorIII),
          child: Center(
              child: Image.asset(
            '${imgUrl}arrow_left.png',
            width: 14.w,
          )),
        ),
      )
    ],
  );
}

Text buildHeader(String header) {
  return Text(
    header,
    style: TextStyle(
        fontSize: 21.sp, fontWeight: FontWeight.w600, fontFamily: fontFamily),
  );
}

buildHeaderDes(String des) {
  return Text(
    des,
    style: TextStyle(
        fontSize: 15.sp,
        color: kGreyColor,
        fontFamily: fontFamily,
        height: 1.6),
  );
}

buildAuthButton(String buttonText, VoidCallback press) {
  return InkWell(
    onTap: press,
    child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20.r),
        decoration: BoxDecoration(
            color: kGreyBgColor, borderRadius: buildBorderRadius(50)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //     width: 15,
            //     height: 15,
            //     child: CircularProgressIndicator(
            //       valueColor: const AlwaysStoppedAnimation(),
            //       strokeWidth: 4.0,
            //       color: kBlackColor.withOpacity(0.8),
            //       backgroundColor: Colors.white,
            //     )),
            sizedBoxWidth(10),
            Text(
              buttonText,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.w500),
            ),
          ],
        )),
  );
}

InkWell buildGoogle(VoidCallback press) {
  return InkWell(
    onTap: press,
    child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20.r),
        decoration: BoxDecoration(
            color: kBgColor,
            border: Border.all(
              color: kGoogleButtonColor,
              width: 1.0.w,
            ),
            borderRadius: buildBorderRadius(50)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              '${imgUrl}google.png',
              width: 17.w,
            ),
            sizedBoxWidth(10),
            Text(
              'Google',
              style: TextStyle(
                  color: kGreyColor, fontSize: 14.sp, fontFamily: fontFamily),
            ),
          ],
        )),
  );
}
