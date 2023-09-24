part of '../ui_kit.dart';

/// {@template appErrorScreen}
/// App error screen.
/// {@endtemplate}
class AppErrorScreen extends StatelessWidget {
  /// Error.
  final Object? error;

  /// {@macro appErrorScreen}
  const AppErrorScreen({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            error != null ? error.toString() : 'Something went wrong',
          ),
        ),
      ),
    );
  }
}
