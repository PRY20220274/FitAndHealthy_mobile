import 'package:dio/dio.dart';
import 'package:fit_healthy/domain/models/goals/physical_goal_create.dart';
import 'package:fit_healthy/domain/models/goals/physical_goal_read.dart';
import 'package:fit_healthy/domain/models/goals/physical_nutricional_goal.dart';
import 'package:fit_healthy/persistence/remote/implements/goals_repository.dart';
import 'package:flutter/material.dart';

class GoalsProvider extends ChangeNotifier {
  final GoalsRepository _goalsRepository;

  GoalsProvider(this._goalsRepository);

  late bool _isLoading = false;
  late String _errorMessage = '';
  late bool _mostrarCuadro = false;

  late List<PhysicalNutricionalGoal> _allGoals = [];
  late PhysicalGoalRead _physicalGoalRead = PhysicalGoalRead(
      calories: 0.0,
      cardioPoints: 0,
      completed: '',
      description: '',
      frequency: '',
      id: 0,
      kilometers: 0.0,
      steps: 0);

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  List<PhysicalNutricionalGoal> get allGoals => _allGoals;
  bool get mostrarCuadro => _mostrarCuadro;
  PhysicalGoalRead get physicalGoalRead => _physicalGoalRead;

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

  Future<PhysicalGoalRead> postPhysicalGoal(
      PhysicalGoalCreate physicalGoal) async {
    try {
      _isLoading = true;
      notifyListeners();
      final result = await _goalsRepository.postPhysicalGoal(physicalGoal);
      _isLoading = false;
      _mostrarCuadro = true;
      print('====post  $result');
      _physicalGoalRead = result;
      notifyListeners();
      return result;
    } on DioError catch (err) {
      _isLoading = false;
      _errorMessage = err.toString();
      notifyListeners();
      rethrow;
    }
  }

  void reset() {
    _mostrarCuadro = false;
    _physicalGoalRead = PhysicalGoalRead(
        calories: 0.0,
        cardioPoints: 0,
        completed: '',
        description: '',
        frequency: '',
        id: 0,
        kilometers: 0.0,
        steps: 0);
  }
}
