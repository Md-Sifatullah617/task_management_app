import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:task_management_app/style/style.dart';
import 'package:task_management_app/utility/utilities.dart';

var baseURL = "https://task.teamrabbil.com/api/v1";
var requestHeader = {"Content-Type": "application/json"};

Future<bool> loginRequest(formValues) async {
  var uRL = Uri.parse("$baseURL/login");
  var postBody = json.encode(formValues);

  var response = await http.post(uRL, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == 'success') {
    successToast("Request Success");
    storeUserData(resultBody);
    return true;
  } else {
    errorToast("Request fail! try again");
    return false;
  }
}

Future<bool> registrationRequest(formValues) async {
  var uRL = Uri.parse("$baseURL/registration");
  var postBody = json.encode(formValues);

  var response = await http.post(uRL, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == 'success') {
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request fail! try again");
    return false;
  }
}

Future<bool> verifyEmailRequest(email) async {
  var uRL = Uri.parse("$baseURL/RecoverVerifyEmail/$email");

  var response = await http.get(uRL, headers: requestHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == 'success') {
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request fail! try again");
    return false;
  }
}

Future<bool> verifyOTPRequest(email, oTP) async {
  var uRL = Uri.parse("$baseURL/RecoverVerifyEmail/$email/$oTP");

  var response = await http.get(uRL, headers: requestHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == 'success') {
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request fail! try again");
    return false;
  }
}

Future<bool> setPwdRequest(formValues) async {
  var uRL = Uri.parse("$baseURL/RecoverVerifyEmail/RecoverResetPass");
  var postBody = json.encode(formValues);
  var response = await http.post(uRL, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == 'success') {
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request fail! try again");
    return false;
  }
}
