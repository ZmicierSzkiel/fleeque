import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:fleeque/data/models/user_model.dart';
import 'package:fleeque/data/shared_preferences_provider/shared_preferences_provider.dart';

import 'package:fleeque/domain/entities/user.dart';

class SharedPreferencesProviderImpl implements SharedPreferencesProvider {
  late SharedPreferences prefs;
  static const String _userKey = 'userKey';
  static const String _isFirstLaunchKey = 'firstLaunchKey';

  @override
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<void> saveUser(
    UserMapper user,
  ) async {
    final String jsonUser = jsonEncode(
      user.toJson(),
    );
    prefs.setString(_userKey, jsonUser);
  }

  @override
  Future<bool?> isFirstLaunch() async {
    return prefs.getBool(_isFirstLaunchKey);
  }

  @override
  Future<void> setFirstLaunch() async {
    await prefs.setBool(
      _isFirstLaunchKey,
      true,
    );
  }

  @override
  Future<User?> getUser() async {
    final String? prefUser = prefs.getString(_userKey);
    if (prefUser != null) {
      return UserMapper.fromJson(
        jsonDecode(prefUser),
      );
    } else {
      return null;
    }
  }

  @override
  Future<bool> deleteUser() async {
    return prefs.remove(_userKey);
  }
}
