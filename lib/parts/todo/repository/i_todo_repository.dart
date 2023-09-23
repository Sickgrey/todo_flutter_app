part of todo_part;

/// {@template iTodoRepository}
/// Todo repository interface.
/// {@endtemplate}
abstract class ITodoRepository {
  /// Returns todos data.
  Future<List<TodoItem>> fetchTodos();

  /// Add data.
  Future<void> createTodo({required String title});
}
