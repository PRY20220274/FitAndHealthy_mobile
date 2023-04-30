import 'package:fit_healthy/domain/models/userdata/measure_update.dart';
import 'package:fit_healthy/persistence/remote/implements/user_data_repository.dart';
import 'package:flutter/foundation.dart';

class UserDataProvider extends ChangeNotifier {
  final UserDataRepository _userDataRepository;

  UserDataProvider(this._userDataRepository);

  MeasureUpdate _measureUpdate = MeasureUpdate(weight: 0, height: 0);

  MeasureUpdate get measureUpdate => _measureUpdate;

  Future<void> updateMeasures() async {
    try {
      await _userDataRepository.updateMeasures(_measureUpdate);
      notifyListeners();
    } on Exception catch (_) {
      rethrow;
    }
  }

  double getIMC() {
    if (_measureUpdate.height == 0) return 0;
    return _measureUpdate.weight / _measureUpdate.height;
  }

  void buildMeasureUpdate({double? height, double? weight}) {
    _measureUpdate = _measureUpdate.copyWith(height: height, weight: weight);
  }

  String? validateHeight(String? value) {
    if (value == null || value.isEmpty) return 'La estatura es requerido.';

    const heightRegex = r"""^(?!0*[.,]0*$|[.,]0*$|0*$)\d+[,.]?\d{0,2}$""";

    if (!RegExp(heightRegex).hasMatch(value)) {
      return 'Estatura inválida.';
    }

    final valueDouble = double.parse(value);

    if (valueDouble < 1 || valueDouble >= 3.0) {
      return 'Estatura inválida.';
    } else {
      return null;
    }
  }

  String? validateWeight(String? value) {
    if (value == null || value.isEmpty) return 'El peso es requerido.';

    const heightRegex = r"""^(?!0*[.,]0*$|[.,]0*$|0*$)\d+[,.]?\d{0,2}$""";

    if (!RegExp(heightRegex).hasMatch(value)) {
      return 'Peso inválido.';
    }

    final valueDouble = double.parse(value);

    if (valueDouble < 1) {
      return 'Peso inválido.';
    } else {
      return null;
    }
  }
}
