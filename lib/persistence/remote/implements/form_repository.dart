import 'package:dio/dio.dart';
import 'package:fit_healthy/domain/models/forms/form_read.dart';
import 'package:fit_healthy/domain/models/forms/questionnaire_read.dart';
import 'package:fit_healthy/domain/models/forms/questionnaire_create.dart';
import 'package:fit_healthy/domain/utils/constants/api_constants.dart';
import 'package:fit_healthy/persistence/remote/interfaces/base_form_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormRepository extends BaseFormRepository {
  static const String _baseUrl = AUTH_API;
  static final _dio = Dio();

  @override
  Future<FormRead> getFormByCategory(String categoryId) async {
    try {
      const url = _baseUrl + '/questionnaires-api/questionnaires';

      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

      final responseForm = await _dio.get(url,
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          queryParameters: {'category_id': categoryId});

      if (responseForm.statusCode != 200) {
        throw Exception(responseForm.statusCode);
      }

      final form = FormRead.fromMap(responseForm.data);
      return form;
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<QuestionnaireRead> postQuestionnaire(
      QuestionnaireCreate answers) async {
    try {
      const url = _baseUrl + '/questionnaires-api/solved';

      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

      final request = answers.toJson();
      final response = await _dio.post(url,
          data: request,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      if (response.statusCode != 201) {
        throw Exception(response.statusCode);
      }

      final questionnaire = QuestionnaireRead.fromMap(response.data);
      return questionnaire;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
