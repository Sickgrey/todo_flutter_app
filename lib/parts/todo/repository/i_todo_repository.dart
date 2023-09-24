part of todo_part;

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
}
