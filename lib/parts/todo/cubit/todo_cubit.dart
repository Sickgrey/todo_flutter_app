part of todo_part;

/// {@template todoCubit}
/// Todo list control cubit.
/// {@endtemplate}
class TodoCubit extends Cubit<TodoState> {
  /// Instance of [ITodoRepository].
  final ITodoRepository todoRepository;

  /// {@macro todoCubit}
  TodoCubit({required this.todoRepository}) : super(const TodoInitial());

  Future<void> fetchTodos() async {
    try {
      final data = await todoRepository.fetchTodos();
      emit(TodoLoadSuccess(
        todoList: data,
        filteredTodoList: data,
        currentFilter: TodoFilterType.all,
      ));
    } catch (e) {
      emit(TodoLoadFailed(error: e));
    }
  }

  Future<void> updateCompleteStatus({
    required String todoUrl,
    required bool isCompleted,
  }) async {
    try {
      if (state is TodoLoadSuccess) {
        final currentState = state as TodoLoadSuccess;
        await todoRepository.updateTodo(
            todoUrl: todoUrl, isCompleted: isCompleted);
        final data = await todoRepository.fetchTodos();
        emit(currentState.copyWith(
          todoList: data,
          filteredTodoList: _filterItems(
            items: data,
            filterType: currentState.currentFilter,
          ),
        ));
      }
    } catch (e) {
      emit(TodoLoadFailed(error: e));
    }
  }

  void filterTodos(TodoFilterType filterType) {
    if (state is TodoLoadSuccess) {
      final currentState = state as TodoLoadSuccess;

      emit(currentState.copyWith(
        filteredTodoList: _filterItems(
          items: currentState.todoList,
          filterType: filterType,
        ),
        currentFilter: filterType,
      ));
    }
  }

  List<TodoItem> _filterItems({
    required List<TodoItem> items,
    required TodoFilterType filterType,
  }) {
    List<TodoItem> todoList = List<TodoItem>.from(items);

    switch (filterType) {
      case TodoFilterType.all:
        break;
      case TodoFilterType.completed:
        todoList =
            todoList.where((element) => element.completed == true).toList();
        break;
      case TodoFilterType.uncompleted:
        todoList =
            todoList.where((element) => element.completed == false).toList();
        break;
    }
    return todoList;
  }

  Future<void> createTodo({required String title}) async {
    try {
      if (state is TodoLoadSuccess) {
        final currentState = state as TodoLoadSuccess;
        await todoRepository.createTodo(title: title);
        final data = await todoRepository.fetchTodos();
        emit(currentState.copyWith(
          todoList: data,
          filteredTodoList: _filterItems(
            items: data,
            filterType: currentState.currentFilter,
          ),
        ));
      }
    } catch (e) {
      emit(TodoLoadFailed(error: e));
    }
  }

  Future<void> deleteTodo({required String todoUrl}) async {
    try {
      if (state is TodoLoadSuccess) {
        final currentState = state as TodoLoadSuccess;
        await todoRepository.deleteTodo(todoUrl: todoUrl);

        final data = await todoRepository.fetchTodos();

        emit(currentState.copyWith(
          todoList: data,
          filteredTodoList: _filterItems(
            items: data,
            filterType: currentState.currentFilter,
          ),
        ));
      }
    } catch (e) {
      emit(TodoLoadFailed(error: e));
    }
  }
}

/// Context extension for quick access to [TodoCubit].
extension TodoCubitBuildContextX on BuildContext {
  /// Instance of [TodoCubit].
  TodoCubit get readTodoCubit => read<TodoCubit>();
}
