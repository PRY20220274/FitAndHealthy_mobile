import 'package:fit_healthy/domain/models/iot/user_physical_data.dart';
import 'package:fit_healthy/persistence/remote/implements/iot_repository.dart';
import 'package:flutter/foundation.dart';

class IotProvider extends ChangeNotifier {
  final IotRepository _iotRepository;

  IotProvider(this._iotRepository);

  late bool _isLoading = false;

  late UserPhysicalData _userPhysicalData = UserPhysicalData(
    id: 0,
    steps: 0,
    heartRate: 0,
    cardioPoints: 0,
    breathingRate: 0,
    calories: 0,
    kilometersTraveled: 0,
  );

  UserPhysicalData get userPhysicalData => _userPhysicalData;
  bool get isLoading => _isLoading;

  Future<void> getPhysicalData() async {
    try {
      _isLoading = true;
      notifyListeners();
      _userPhysicalData = await _iotRepository.getPhysicalData();
      _isLoading = false;
      notifyListeners();
    } on Exception catch (_) {
      notifyListeners();
      rethrow;
    }
  }

  set isLoading(bool value) {
    _isLoading = value;
  }
}
