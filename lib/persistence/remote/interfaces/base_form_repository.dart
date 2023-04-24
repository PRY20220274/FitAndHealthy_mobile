import 'package:fit_healthy/domain/models/forms/form_read.dart';

abstract class BaseFormRepository {
  Future<FormRead> getFormByCategory(String categoryId);
}
