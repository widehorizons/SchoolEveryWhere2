import '../utils/flavor_config.dart';

class EndPoints {
  static final baseUrl = FlavorConfig.instance.values.baseUrl;

  static final api = '$baseUrl/api/';

  static const login = 'login.php';
  static const loginType = 'loginType.php';
  static const chekIdentiifer = 'check_identifier.php';
  static const getStudentPages = 'getStudentPages.php';
}
