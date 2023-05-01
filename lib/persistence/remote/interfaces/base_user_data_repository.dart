import 'package:fit_healthy/domain/models/auth/user_signup.dart';
import 'package:fit_healthy/domain/models/userdata/measure_update.dart';

abstract class BaseUserDataRepository {
  Future<void> updateMeasures (MeasureUpdate measures);
  Future<void> getUserData ();
}