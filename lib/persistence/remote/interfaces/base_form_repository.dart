import 'package:fit_healthy/domain/models/forms/form_read.dart';
import 'package:fit_healthy/domain/models/forms/questionnaire_create.dart';
import 'package:fit_healthy/domain/models/forms/questionnaire_read.dart';

abstract class BaseFormRepository {
  Future<FormRead> getFormByCategory(String categoryId);
  Future<QuestionnaireRead> postQuestionnaire(QuestionnaireCreate answers);
}
