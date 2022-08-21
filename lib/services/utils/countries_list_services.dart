import 'dart:convert';

import 'package:covid_19/services/utils/app_url.dart';
import 'package:http/http.dart' as http;

class CountriesListServices {
  Future<List<dynamic>> getCountriesData() async {
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    final json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return json;
    } else {
      return json;
    }
  }
}
