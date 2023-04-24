import 'package:fit_healthy/domain/models/forms/form_read.dart';
import 'package:fit_healthy/persistence/remote/implements/form_repository.dart';
import 'package:flutter/material.dart';

class FormProvider extends ChangeNotifier {
  final FormRepository _formRepository;

  FormProvider(this._formRepository);

  late bool _isLoading = false;
  late String _errorMessage = '';

  late FormRead? _formRead = null;

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  FormRead? get formRead => _formRead;

  Future<void> getFormByCategory(String categoryId) async {
    try {
      _isLoading = true;
      notifyListeners();
      final result = await _formRepository.getFormByCategory(categoryId);
      _isLoading = false;

      _formRead = result;
      print('====getForm  $_formRead');

      notifyListeners();
    } on Exception catch (err) {
      _isLoading = false;
      _errorMessage = err.toString();
      notifyListeners();
      rethrow;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
