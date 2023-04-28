import 'package:fit_healthy/domain/models/types/activity.dart';
import 'package:fit_healthy/domain/models/types/objective.dart';

abstract class BaseTypesRepository {
  Future<List<Activity>> getActivities();
  Future<List<Objective>> getObjectives();
}