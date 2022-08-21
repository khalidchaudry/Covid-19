import 'dart:convert';

import 'package:covid_19/model/world_state_model.dart';
import 'package:covid_19/services/utils/app_url.dart';
import 'package:http/http.dart' as http;

class StateServices {
  Future<WorldStateModel> getStatesData() async {
    final response = await http.get(Uri.parse(AppUrl.worldStateApi));
    final jsonData = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return WorldStateModel.fromJson(jsonData);
    } else {
      throw Exception('Something Wrong');
    }
  }
}
