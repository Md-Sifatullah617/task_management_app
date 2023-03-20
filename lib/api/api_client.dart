import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:task_management_app/style/style.dart';
import 'package:task_management_app/utility/utilities.dart';

var baseURL = "https://task.teamrabbil.com/api/v1";
var requestHeader = {"Content-Type": "application/json"};
Future<String?> token = readUserData("token");
  var requestHeaderWithToken = {
    "Content-Type": "application/json",
    "token": "$token"
  };

Future<bool> loginRequest(formValues) async {
  var uRL = Uri.parse("$baseURL/login");
  var postBody = json.encode(formValues);

  var response = await http.post(uRL, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == 'success') {
    successToast("Request Success");
    await writeUserData(resultBody);
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
    await writeEmailVerification(email);
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request fail! try again");
    return false;
  }
}

Future<bool> verifyOTPRequest(email, oTP) async {
  var uRL = Uri.parse("$baseURL/RecoverVerifyOTP/$email/$oTP");

  var response = await http.get(uRL, headers: requestHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == 'success') {
    await writeOTPVerification(oTP);
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request fail! try again");
    return false;
  }
}

Future<bool> setPwdRequest(formValues) async {
  var uRL = Uri.parse("$baseURL/RecoverResetPass");
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

Future<List> taskLIstRequest(status) async {
  var uRL = Uri.parse("$baseURL/listTaskByStatus/$status");
  var response = await http.get(uRL, headers: requestHeaderWithToken);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody["status"] == "success") {
    successToast("Request Success");
    return resultBody['data'];
  } else {
    errorToast("Request fail ! try again");
    return [];
  }
}

Future<bool> taskCreateRequest(formValues) async {
  var uRL = Uri.parse("$baseURL/createTask");
  var postBody = json.encode(formValues);
  var response =
      await http.post(uRL, headers: requestHeaderWithToken, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == 'success') {
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> deleteTaskRequest(id) async {
  var uRL = Uri.parse("$baseURL/deleteTask/$id");
  var response = await http.get(uRL, headers: requestHeaderWithToken);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody["status"] == "success") {
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> updateTaskRequest(id, status) async {
  var uRL = Uri.parse("$baseURL/updateTaskStatus/$id/$status");
  var response = await http.get(uRL, headers: requestHeaderWithToken);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody["status"] == "success") {
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> updateProfile(formValues) async {
  var uRL = Uri.parse("$baseURL/profileUpdate");
  var postBody = json.encode(formValues);
  var response =
      await http.post(uRL, headers: requestHeaderWithToken, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == 'success') {
    successToast("Request Updated");
    return true;
  } else {
    errorToast("Request fail ! try again");
    return false;
  }
}
