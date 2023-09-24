part of '../todo_part.dart';

/// {@template iTodoRepository}
/// Todo repository interface.
/// {@endtemplate}
abstract class ITodoRepository {
  /// Returns todos data.
  Future<List<TodoItem>> fetchTodos();

  /// Create data.
  Future<void> createTodo({required String title});

  /// Delete todo.
  Future<void> deleteTodo({required String todoUrl});

  /// Update todo completion status.
  Future<void> updateTodo({required String todoUrl, required bool isCompleted});

  /// Frees up resources.
  void dispose();
}
