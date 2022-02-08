import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hospital/src/models/ambulance.models.dart';
import 'package:hospital/src/services/hospital.services.dart';

class HospitalState extends ChangeNotifier {
  HospitalState() {
    fetchHospiatlList();
  }
  List<Ambulance>? _hospitals;
  List<Ambulance>? get hospitals => _hospitals;

  fetchHospiatlList() async {
    try {
      var response = (await HospitalServices.instance.fetchHospital());
      _hospitals = response;
      notifyListeners();
    } catch (error) {
      log(error.toString());
      Fluttertoast.showToast(msg: error.toString());
    }
  }
}

final hospitalProvider =
    ChangeNotifierProvider<HospitalState>((ref) => HospitalState());
