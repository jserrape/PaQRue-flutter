import 'dart:convert';
import 'dart:io';

import 'package:history_maker/src/exceptions/NetworkException.dart';
import 'package:history_maker/src/model/User.dart';

import 'package:http/http.dart' as http;

import 'package:history_maker/src/util/constants.dart' as Constants;

Future<http.Response> getAllParks() async {
  String url = Constants.apiBaseURL + Constants.getAllParks;
  try {
    final response = await http.post(
      url,
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