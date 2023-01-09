import 'dart:developer';

import '../config/Constants/enums.dart';
import '../config/Constants/prefs_keys.dart';
import '../config/utils/prefs.dart';
import '../models/users/Student.dart';
import '../models/users/parent.dart';
import '../models/users/staff.dart';
import '../models/users/user.dart';

class ProfileService {
  static saveCurrentUser(Map<String, dynamic> userData) {
    final User currentUser = currentUserModel(userData);
    log('User Model Here is $currentUser');
    Prefs.setMap(PrefsKeys.currentUser, currentUser.toJson());
    log((Prefs.getMap(PrefsKeys.currentUser).toString()).toString());
    saveUserToken(currentUser.token!);
  }

  static currentUserModel(Map<String, dynamic> userData) {
    if (userData['type'] == UserPortals.Student.name) {
      return Student.fromJson(userData);
    } else if (userData['type'] == UserPortals.Staff.name) {
      return Staff.fromJson(userData);
    } else if (userData['type'] == UserPortals.Parent.name) {
      return Parent.fromJson(userData);
    } else {
      return Student.fromJson(userData);
    }
  }

  static get currentUser =>
      currentUserModel(Prefs.getMap(PrefsKeys.currentUser));

  static saveUserToken(String token) {
    Prefs.setString(PrefsKeys.token, token);
  }
}
