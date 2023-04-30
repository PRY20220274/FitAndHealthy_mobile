import 'package:dio/dio.dart';
import 'package:fit_healthy/domain/models/iot/google_access_data.dart';
import 'package:fit_healthy/domain/models/iot/user_physical_data.dart';
import 'package:fit_healthy/domain/utils/constants/api_constants.dart';
import 'package:fit_healthy/persistence/remote/interfaces/base_iot_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IotRepository extends BaseIotRepository {
  static const String _baseUrl = AUTH_API;
  static final _dio = Dio();

  @override
  Future<UserPhysicalData> getPhysicalData() async {
    try {
      const url = _baseUrl + '/fit-api/physical-data';
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await _dio.get(
        url,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      final userPhysicalData = UserPhysicalData.fromMap(response.data);
      return userPhysicalData;
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<String> getGoogleAuthenticationUrl() async {
    try {
      const url = _baseUrl + '/fit-api/iot/authentication-url';
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await _dio.get(
        url,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      final data = GoogleAccessData.fromMap(response.data);

      return data.url;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
