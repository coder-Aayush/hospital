import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hospital/src/models/hosptial.models.dart';
import 'package:hospital/src/services/hospital.services.dart';

class HospitalState extends ChangeNotifier {
  List<Hospital>? _hospitals;
  List<Hospital>? get hospitals => _hospitals;

  fetchHospiatlList() async {
    try {
      List<Hospital> response = await HospitalServices.instance.fetchHospital();
      log(response[0].toJson().toString());
      log(response.toString());
    } catch (error) {
      Fluttertoast.showToast(msg: error.toString());
    }
  }
}
