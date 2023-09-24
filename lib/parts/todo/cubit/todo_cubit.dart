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

  Future<void> switchCompleteStatus({required String id}) async {
    if (state is TodoLoadSuccess) {
      final currentState = state as TodoLoadSuccess;

      final todoList = List<TodoItem>.from(currentState.filteredTodoList);

      final todoIndex = todoList.indexWhere((element) => element.id == id);
      if (todoIndex > -1) {
        final todoItem = todoList[todoIndex];
        todoList[todoIndex] = todoItem.copyWith(completed: !todoItem.completed);
        emit(currentState.copyWith(
            todoList: todoList, filteredTodoList: todoList));
      }
    }
  }

  void filterTodos(TodoFilterType filterType) {
    if (state is TodoLoadSuccess) {
      final currentState = state as TodoLoadSuccess;

      List<TodoItem> todoList = List<TodoItem>.from(currentState.todoList);

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
      emit(currentState.copyWith(
        filteredTodoList: todoList,
        currentFilter: filterType,
      ));
    }
  }

  Future<void> createTodo({required String title}) async {
    try {
      await todoRepository.createTodo(title: title);
    } catch (e) {
      emit(TodoLoadFailed(error: e));
    }
  }

  Future<void> deleteTodo({required String todoUrl}) async {
    try {
      await todoRepository.deleteTodo(todoUrl: todoUrl);
      await fetchTodos();
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
