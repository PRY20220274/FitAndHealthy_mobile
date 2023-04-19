import 'package:fit_healthy/domain/models/goals/physical_nutricional_goal.dart';
import 'package:fit_healthy/persistence/remote/implements/goals_repository.dart';
import 'package:flutter/material.dart';

class GoalsProvider extends ChangeNotifier {
  final GoalsRepository _goalsRepository;

  GoalsProvider(this._goalsRepository);

  late bool _isLoading = false;
  late String _errorMessage = '';

  late List<PhysicalNutricionalGoal> _allGoals = [];

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  List<PhysicalNutricionalGoal> get allGoals => _allGoals;

  Future<List<PhysicalNutricionalGoal>> getAllGoals() async {
    try {
      _isLoading = true;
      notifyListeners();
      final result = await _goalsRepository.getAllGoals();
      _isLoading = false;

      _allGoals = result;
      print('====getAllGoals  $_allGoals');

      notifyListeners();
      return result;
    } on Exception catch (err) {
      _isLoading = false;
      _errorMessage = err.toString();
      notifyListeners();
      rethrow;
    }
  }
}
