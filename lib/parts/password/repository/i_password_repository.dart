part of '../password_part.dart';

/// {@template iPasswordRepository}
/// Password repository interface.
/// {@endtemplate}
abstract class IPasswordRepository {
  /// Fetch password from storage.
  Future<String?> fetchPassword();

  /// Save password.
  Future<void> savePassword({required String password});
}
