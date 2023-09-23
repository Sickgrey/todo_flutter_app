part of todo_part;

/// {@template todoRepository}
/// Implementation of [TodoRepository] with production functionality.
/// {@endtemplate}
class TodoRepository extends ITodoRepository {
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
  Future<void> createTodo({required String title}) async {
    await todoDataProvider.createTodo(title: title);
  }
}
