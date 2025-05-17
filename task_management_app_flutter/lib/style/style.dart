import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

//customised color style
const colorRed = Color.fromRGBO(231, 28, 36, 1);
const colorDark = Color.fromRGBO(136, 28, 32, 1);
const colorGreen = Color.fromRGBO(33, 191, 115, 1);
const colorBlue = Color.fromRGBO(52, 152, 219, 1);
const colorOrange = Color.fromRGBO(230, 126, 34, 1);
const colorWhite = Color.fromRGBO(255, 255, 255, 1);
const colorDarkBlue = Color.fromRGBO(44, 62, 80, 1);
const colorLightGray = Color.fromRGBO(135, 142, 150, 1);
const colorLight = Color.fromRGBO(211, 211, 211, 1);

TextStyle head1Text(textcolor) {
  return TextStyle(
    color: textcolor,
    fontSize: 28,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w700,
  );
}

TextStyle head6Text(textcolor) {
  return TextStyle(
    color: textcolor,
    fontSize: 16,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w400,
  );
}

TextStyle head7Text(textcolor) {
  return TextStyle(
    color: textcolor,
    fontSize: 13,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w400,
  );
}

TextStyle head9Text(textcolor) {
  return TextStyle(
    color: textcolor,
    fontSize: 10,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w400,
  );
}

InputDecoration appInputDecoration(label) {
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: colorGreen, width: 1),
    ),
    fillColor: colorWhite,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: colorWhite, width: 0),
    ),
    border: const OutlineInputBorder(),
    labelText: label,
  );
}

DecoratedBox appDropDownStyle(child) {
  return DecoratedBox(
    decoration: BoxDecoration(
      color: colorWhite,
      border: Border.all(color: colorWhite, width: 1),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: child,
    ),
  );
}

SvgPicture screenBackground(context) {
  return SvgPicture.asset(
    "assets/images/bgScreen.svg",
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
  );
}

ButtonStyle appButtonStyle() {
  return ElevatedButton.styleFrom(
      elevation: 1,
      padding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)));
}

ButtonStyle tinyButtonStyle(btnColor) {
  return ElevatedButton.styleFrom(
      elevation: 1, padding: EdgeInsets.zero, backgroundColor: btnColor);
}

TextStyle buttonTextStyle() {
  return const TextStyle(
      fontSize: 14, fontFamily: 'poppins', fontWeight: FontWeight.w400);
}

Ink successButtonChild(String ButtonText) {
  return Ink(
    decoration: BoxDecoration(
        color: colorGreen, borderRadius: BorderRadius.circular(6)),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(
        ButtonText,
        style: buttonTextStyle(),
      ),
    ),
  );
}

void customToast(String msg, {bool? isError = false}) {
  Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: isError == true ? colorRed : colorGreen,
      textColor: colorWhite,
      fontSize: 16);
}

PinTheme appOTPStyle() {
  return PinTheme(
      inactiveColor: colorLight,
      inactiveFillColor: colorWhite,
      selectedColor: colorGreen,
      activeColor: colorWhite,
      selectedFillColor: colorGreen,
      shape: PinCodeFieldShape.box,
      borderRadius: BorderRadius.circular(5),
      fieldHeight: 50,
      borderWidth: 0.5,
      fieldWidth: 45,
      activeFillColor: colorWhite);
}

Container statusChild(statusText, statusColor) {
  return Container(
    alignment: Alignment.center,
    height: 20,
    width: 60,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: statusColor),
    child: Text(
      statusText,
      style: const TextStyle(
          color: colorWhite, fontSize: 10, fontWeight: FontWeight.w400),
    ),
  );
}

showimage64(base64String) {
  UriData? data = Uri.parse(base64String).data;
  Uint8List image;
  if (data != null) {
    image = data.contentAsBytes();
  } else {
    image = base64Decode(base64String);
  }
  return image;
}

statuscount(String status, int statusnumber) {
  return Expanded(
    child: Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FittedBox(
              child: Text(
                statusnumber.toString(),
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            FittedBox(child: Text(status))
          ],
        ),
      ),
    ),
  );
}
