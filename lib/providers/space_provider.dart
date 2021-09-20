import 'dart:convert';

import 'package:cozy_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  getRecommendedSpaces() async {
    var result = await http
        .get(Uri.parse('http://bwa-cozy.herokuapp.com/recommended-spaces'));
    // print(result.statusCode);
    // print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<SpaceModel> spaceModel =
          data.map((e) => SpaceModel.fromJson(e)).toList();
      return spaceModel;
    } else {
      return <SpaceModel>[];
    }
  }
}
