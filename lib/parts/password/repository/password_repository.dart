part of '../password_part.dart';

/// {@template todoRepository}
/// Implementation of [PasswordRepository] with production functionality.
/// {@endtemplate}
class PasswordRepository implements IPasswordRepository {
  final _passwordKey = 'passwordKey';

  @override
  Future<String?> fetchPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_passwordKey);
  }

  @override
  Future<void> savePassword({required String password}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_passwordKey, password);
  }
}
