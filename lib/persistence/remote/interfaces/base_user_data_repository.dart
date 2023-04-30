import 'package:fit_healthy/domain/models/userdata/measure_update.dart';

abstract class BaseUserDataRepository {
  Future<void> updateMeasures (MeasureUpdate measures);
}