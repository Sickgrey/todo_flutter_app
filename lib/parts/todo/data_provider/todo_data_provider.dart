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
}