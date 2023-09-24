part of '../password_part.dart';

/// {@template passwordState}
/// Abstract state class for [PasswordCubit].
/// {@endtemplate}
abstract class PasswordState extends Equatable {
  /// {@macro passwordState}
  const PasswordState();

  @override
  List<Object?> get props => [];
}

/// {@template passwordInitial}
/// Initial state.
/// {@endtemplate}
class PasswordInitial extends PasswordState {
  /// {@macro passwordInitial}
  const PasswordInitial();
}

/// {@template passwordLoadSuccess}
/// Load success state.
/// {@endtemplate}
class PasswordLoadSuccess extends PasswordState {
  /// Password.
  final String? password;

  /// {@macro passwordLoadSuccess}
  const PasswordLoadSuccess({required this.password});

  @override
  List<Object?> get props => [password];
}

/// {@template passwordLoadFailed}
/// Load failed state.
/// {@endtemplate}
class PasswordLoadFailed extends PasswordState {
  /// Error.
  final Object? error;

  /// {@macro passwordLoadFailed}
  const PasswordLoadFailed({this.error});
}
