part of '../todo_part.dart';

/// {@template todoRepository}
/// Implementation of [TodoRepository] with production functionality.
/// {@endtemplate}
class TodoRepository implements ITodoRepository {
  /// Instance of [ITodoDataProvider].
  final ITodoDataProvider todoDataProvider;

  /// {@macro todoRepository}
  TodoRepository({required this.todoDataProvider});

  @override
  Future<List<TodoItem>> fetchTodos() async {
    final data = await todoDataProvider.fetchTodos();

    return data.map((dto) => TodoItem.fromDto(dto)).toList();
  }

  @override
  Future<void> createTodo({required String title}) async =>
      await todoDataProvider.createTodo(title: title);

  @override
  Future<void> deleteTodo({required String todoUrl}) async =>
      await todoDataProvider.deleteTodo(todoUrl: todoUrl);

  @override
  Future<void> updateTodo({
    required String todoUrl,
    required bool isCompleted,
  }) async =>
      await todoDataProvider.updateTodo(
        todoUrl: todoUrl,
        isCompleted: isCompleted,
      );

  @override
  void dispose() => todoDataProvider.dispose();
}
