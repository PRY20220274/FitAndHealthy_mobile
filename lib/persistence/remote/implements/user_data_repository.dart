import 'package:dio/dio.dart';
import 'package:fit_healthy/domain/models/userdata/measure_update.dart';
import 'package:fit_healthy/domain/utils/constants/api_constants.dart';
import 'package:fit_healthy/persistence/remote/interfaces/base_user_data_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataRepository extends BaseUserDataRepository {
  static const String _baseUrl = AUTH_API;
  static final _dio = Dio();

  @override
  Future<void> updateMeasures(MeasureUpdate measures) async {
    try {
      const url = _baseUrl + '/accounts-api/users/id';
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final request = measures.toJson();

      final response = await _dio.patch(
        url,
        data: request,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      prefs.setDouble('height', measures.height);
      prefs.setDouble('weight', measures.weight);
    } on Exception catch (_) {
      rethrow;
    }
  }
}
