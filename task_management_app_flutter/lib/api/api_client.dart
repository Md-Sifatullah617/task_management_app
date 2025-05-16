import 'dart:convert';

import 'package:http/http.dart' as http;

import '../style/style.dart';
import '../utility/utilities.dart';

var baseURL = "https://task.teamrabbil.com/api/v1";
var requestHeader = {"Content-Type": "application/json"};

Future<bool> loginRequest(formValues) async {
  var uRL = Uri.parse("$baseURL/login");
  var postBody = json.encode(formValues);

  var response = await http.post(uRL, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200 && resultBody['status'] == 'success') {
    customToast("Request Success");
    await writeUserData(resultBody);
    return true;
  } else {
    customToast(isError: true, "Request fail! try again");
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
    customToast("Request Success");
    return true;
  } else {
    customToast(isError: true, "Request fail! try again");
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
    customToast("Request Success");
    return true;
  } else {
    customToast(isError: true, "Request fail! try again");
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
    customToast("Request Success");
    return true;
  } else {
    customToast(isError: true, "Request fail! try again");
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
    customToast("Request Success");
    return true;
  } else {
    customToast(isError: true, "Request fail! try again");
    return false;
  }
}

Future<Map<String, String>> _getHeadersWithToken() async {
  String? token = await readUserData("token");
  if (token == null) {
    throw Exception("Token is missing. Please log in again.");
  }
  return {"Content-Type": "application/json", "token": token};
}

Future<List> taskLIstRequest(status) async {
  var uRL = Uri.parse("$baseURL/listTaskByStatus/$status");
  try {
    var requestHeaderWithToken = await _getHeadersWithToken();
    var response = await http.get(uRL, headers: requestHeaderWithToken);
    var resultCode = response.statusCode;
    var resultBody = json.decode(response.body);
    if (resultCode == 200 && resultBody["status"] == "success") {
      customToast("Request Success");
      return resultBody['data'];
    } else {
      customToast(isError: true, "Request fail ! try again");
      return [];
    }
  } catch (e) {
    customToast(isError: true, e.toString());
    return [];
  }
}

Future<bool> taskCreateRequest(formValues) async {
  var uRL = Uri.parse("$baseURL/createTask");
  var postBody = json.encode(formValues);
  try {
    var requestHeaderWithToken = await _getHeadersWithToken();
    var response =
        await http.post(uRL, headers: requestHeaderWithToken, body: postBody);
    var resultCode = response.statusCode;
    var resultBody = json.decode(response.body);
    if (resultCode == 200 && resultBody['status'] == 'success') {
      customToast("Request Success");
      return true;
    } else {
      customToast(isError: true, "Request fail ! try again");
      return false;
    }
  } catch (e) {
    customToast(isError: true, e.toString());
    return false;
  }
}

Future<bool> deleteTaskRequest(id) async {
  var uRL = Uri.parse("$baseURL/deleteTask/$id");
  try {
    var requestHeaderWithToken = await _getHeadersWithToken();
    var response = await http.get(uRL, headers: requestHeaderWithToken);
    var resultCode = response.statusCode;
    var resultBody = json.decode(response.body);
    if (resultCode == 200 && resultBody["status"] == "success") {
      customToast("Request Success");
      return true;
    } else {
      customToast(isError: true, "Request fail ! try again");
      return false;
    }
  } catch (e) {
    customToast(isError: true, e.toString());
    return false;
  }
}

Future<bool> updateTaskRequest(id, status) async {
  var uRL = Uri.parse("$baseURL/updateTaskStatus/$id/$status");
  try {
    var requestHeaderWithToken = await _getHeadersWithToken();
    var response = await http.get(uRL, headers: requestHeaderWithToken);
    var resultCode = response.statusCode;
    var resultBody = json.decode(response.body);
    if (resultCode == 200 && resultBody["status"] == "success") {
      customToast("Request Success");
      return true;
    } else {
      customToast(isError: true, "Request fail ! try again");
      return false;
    }
  } catch (e) {
    customToast(isError: true, e.toString());
    return false;
  }
}

Future<bool> updateProfile(formValues) async {
  var uRL = Uri.parse("$baseURL/profileUpdate");
  var postBody = json.encode(formValues);
  try {
    var requestHeaderWithToken = await _getHeadersWithToken();
    var response =
        await http.post(uRL, headers: requestHeaderWithToken, body: postBody);
    var resultCode = response.statusCode;
    var resultBody = json.decode(response.body);
    if (resultCode == 200 && resultBody['status'] == 'success') {
      customToast("Request Updated");
      return true;
    } else {
      customToast(isError: true, "Request fail ! try again");
      return false;
    }
  } catch (e) {
    customToast(isError: true, e.toString());
    return false;
  }
}

Future<List> taskCountRequest() async {
  var uRL = Uri.parse("$baseURL/taskStatusCount");
  try {
    var requestHeaderWithToken = await _getHeadersWithToken();
    var response = await http.get(uRL, headers: requestHeaderWithToken);
    var resultCode = response.statusCode;
    var resultBody = json.decode(response.body);
    if (resultCode == 200 && resultBody["status"] == "success") {
      customToast("Request Success");
      return resultBody['data'];
    } else {
      customToast(isError: true, "Request fail ! try again");
      return [];
    }
  } catch (e) {
    customToast(isError: true, e.toString());
    return [];
  }
}
