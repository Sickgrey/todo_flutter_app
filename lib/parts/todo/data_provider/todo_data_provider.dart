part of todo_part;

/// {@template todoDataProvider}
/// Implementation of [ITodoDataProvider] with production functionality.
/// {@endtemplate}
class TodoDataProvider implements ITodoDataProvider {
  final _dio = Dio();

  @override
  Future<List<DtoTodoItem>> fetchTodos() async {
    final response = await _dio
        .get('https://csharp-todo-backend.azurewebsites.net/api/v1/todo');
    final data = response.data as List;
    return data
        .map((e) => DtoTodoItem.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> createTodo({required String title}) async {
    final data = <String, dynamic>{
      "title": title,
    };
    await _dio.post(
      'https://csharp-todo-backend.azurewebsites.net/api/v1/todo',
      data: data,
    );
  }

  @override
  Future<void> deleteTodo({required String todoUrl}) async =>
      await _dio.delete(todoUrl);

  @override
  Future<void> updateTodo({
    required String todoUrl,
    required bool isCompleted,
  }) async {
    final data = <String, dynamic>{
      "completed": isCompleted,
    };
    await _dio.patch(todoUrl, data: data);
  }
}
