import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:patientstrack/Models/DataModel.dart';

import 'ApiConstants.dart';

class StatsDataServices {
  Future<PatientsData> getpatientsdata() async {
    final response = await http.get(Uri.parse(Api.baseurl + Api.worldstats));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return PatientsData.fromJson(data);
    } else {
      throw Exception("error");
    }
  }
}
