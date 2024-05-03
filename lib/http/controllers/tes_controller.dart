import 'dart:convert';

import 'package:belajar_api/http/models/tes_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class tesController extends GetxController {
  TesModel? tesM;
  var isLoading = false.obs;

  Future<void> getData() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse("http://10.10.183.21:8000/api"),
        headers: headers,
      );

      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        tesM = TesModel.fromJson(json);
      } else {
        debugPrint(response.statusCode.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
