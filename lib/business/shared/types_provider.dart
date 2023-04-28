import 'package:fit_healthy/domain/models/types/activity.dart';
import 'package:fit_healthy/domain/models/types/objective.dart';
import 'package:fit_healthy/persistence/remote/implements/types_repository.dart';
import 'package:flutter/foundation.dart';

class TypesProvider extends ChangeNotifier {
  final TypesRepository _typesRepository;

  TypesProvider(this._typesRepository);

  late List<Activity> _activities = [];
  late List<Objective> _objectives = [];

  List<Activity> get activites => _activities;
  List<Objective> get objetices => _objectives;

  Future<void> getAllTypes() async {
    try {
      await getActivities();
      await getObjetices();
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<void> getActivities() async {
    try {
      _activities = await _typesRepository.getActivities();
      notifyListeners();
    } on Exception catch (_) {
      notifyListeners();
      rethrow;
    }
  }

  Future<void> getObjetices() async {
    try {
      _objectives = await _typesRepository.getObjectives();
      notifyListeners();
    } on Exception catch (_) {
      notifyListeners();
      rethrow;
    }
  }
}
