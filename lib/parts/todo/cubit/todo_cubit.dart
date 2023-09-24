part of '../todo_part.dart';

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

  Future<void> createTodo({required String title}) async {
    try {
      await todoRepository.createTodo(title: title);
      await _updateList();
    } catch (e) {
      emit(TodoLoadFailed(error: e));
    }
  }

  Future<void> deleteTodo({required String todoUrl}) async {
    try {
      await todoRepository.deleteTodo(todoUrl: todoUrl);
      await _updateList();
    } catch (e) {
      emit(TodoLoadFailed(error: e));
    }
  }

  Future<void> updateCompleteStatus({
    required String todoUrl,
    required bool isCompleted,
  }) async {
    try {
      await todoRepository.updateTodo(
        todoUrl: todoUrl,
        isCompleted: isCompleted,
      );
      await _updateList();
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
    switch (filterType) {
      case TodoFilterType.all:
        return items;
      case TodoFilterType.completed:
        return items.where((element) => element.completed == true).toList();
      case TodoFilterType.uncompleted:
        return items.where((element) => element.completed == false).toList();
    }
  }

  Future<void> _updateList() async {
    if (state is TodoLoadSuccess) {
      final currentState = state as TodoLoadSuccess;

      final data = await todoRepository.fetchTodos();
      emit(currentState.copyWith(
        todoList: data,
        filteredTodoList: _filterItems(
          items: data,
          filterType: currentState.currentFilter,
        ),
      ));
    }
  }
}

/// Context extension for quick access to [TodoCubit].
extension TodoCubitBuildContextX on BuildContext {
  /// Instance of [TodoCubit].
  TodoCubit get readTodoCubit => read<TodoCubit>();
}
