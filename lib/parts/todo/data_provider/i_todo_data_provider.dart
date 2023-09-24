part of todo_part;

/// {@template iTodoDataProvider}
/// Todo data provider interface.
/// {@endtemplate}
abstract class ITodoDataProvider {
  /// Returns todos data.
  Future<List<DtoTodoItem>> fetchTodos();

  /// Create todo.
  Future<void> createTodo({required String title});

  /// Delete todo.
  Future<void> deleteTodo({required String todoUrl});

  /// Update todo completion status.
  Future<void> updateTodo({required String todoUrl, required bool isCompleted});
}
