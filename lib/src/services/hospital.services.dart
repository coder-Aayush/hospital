import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hospital/src/config/app_config.dart';
import 'package:hospital/src/models/hosptial.models.dart';

class HospitalServices {
  HospitalServices._();
  static final HospitalServices instance = HospitalServices._();
  factory HospitalServices() {
    return HospitalServices();
  }

  final Dio _dio = Dio();

  fetchHospital() async {
    try {
      Response response = await _dio.get("${AppConfig.baseUrl}/photos");
      if (response.statusCode == 200) {
        return List<Ambulance>.from(
            response.data.map((ambulance) => Ambulance.fromMap(ambulance)));
      } else {
        throw "Failed to Fetch Hosptial Data";
      }
    } on DioError catch (error) {
      throw error.error;
    }
  }
}
