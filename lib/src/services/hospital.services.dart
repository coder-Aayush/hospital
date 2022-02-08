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

  Future<List<Hospital>> fetchHospital() async {
    try {
      Response response = await _dio.get("${AppConfig.baseUrl}/posts");
      if (response.statusCode == 200) {
        return response.data
            .map((hospital) => Hospital.fromJson(hospital))
            .toList();
      } else {
        throw "Failed to Fetch Hosptial Data";
      }
    } on DioError catch (error) {
      throw error.error;
    }
  }
}
