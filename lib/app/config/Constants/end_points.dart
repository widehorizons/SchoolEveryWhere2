import '../utils/flavor_config.dart';

class EndPoints {
  static final baseUrl = FlavorConfig.instance.values.baseUrl;

  static final api = '$baseUrl/api/';

  static const login = 'login';
}
