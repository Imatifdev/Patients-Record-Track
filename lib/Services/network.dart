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

//hit api without creating model
class CountriesStatsDataServices {
  Future<List<dynamic>> getcountriesdata() async {
    final data;
    final response =
        await http.get(Uri.parse(Api.baseurl + Api.countryendpoint));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("error");
    }
  }
}
