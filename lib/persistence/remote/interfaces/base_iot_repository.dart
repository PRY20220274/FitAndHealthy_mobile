import 'package:fit_healthy/domain/models/iot/user_physical_data.dart';

abstract class BaseIotRepository {
  Future<UserPhysicalData> getPhysicalData();
  Future<String> getGoogleAuthenticationUrl();
}