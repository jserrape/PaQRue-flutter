import 'dart:convert';
import 'dart:io';

import 'package:history_maker/src/exceptions/NetworkException.dart';
import 'package:history_maker/src/model/User.dart';

import 'package:http/http.dart' as http;

import 'package:history_maker/src/util/constants.dart' as Constants;

Future<http.Response> postUser(User user) async {
  String url = Constants.apiBaseURL + Constants.postUser;
  print(url);
  try {
    final response = await http.post(
      url,
      body: json.encode(user.toJson()),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    return response;
  } on IOException {
    throw NetworkException();
  }
}

Future<http.Response> postChangePassword(String email) async {
  String url = Constants.apiBaseURL + Constants.postChangePassword;
  try {
    final response = await http.post(
      url,
      body: json.encode(email),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    return response;
  } on IOException {
    throw NetworkException();
  }
}

Future<http.Response> postLogUser(User user) async {
  String url = Constants.apiBaseURL + Constants.postLogUser;
  try {
    final response = await http.post(
      url,
      body: json.encode(user.toJson()),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    return response;
  } on IOException {
    throw NetworkException();
  }
}

Future<http.Response> postChangeName(User user) async {
  String url = Constants.apiBaseURL + Constants.postChangeName;
  try {
    final response = await http.post(
      url,
      body: json.encode(user.toJson()),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    return response;
  } on IOException {
    throw NetworkException();
  }
}

Future<http.Response> postChangeEmail(String initEmail, String finalEmail) async {
  String url = Constants.apiBaseURL + Constants.postChangeEmail;

  try {
    final response = await http.post(
      url,
      body: json.encode({"initEmail": initEmail,
                        "finalEmail": finalEmail}),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    return response;
  } on IOException {
    throw NetworkException();
  }
}