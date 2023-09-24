part of '../todo_part.dart';

/// {@template todoState}
/// Abstract state class for [TodoCubit].
/// {@endtemplate}
abstract class TodoState extends Equatable {
  /// {@macro todoState}
  const TodoState();

  @override
  List<Object> get props => [];
}

/// {@template todoInitial}
/// Initial state.
/// {@endtemplate}
class TodoInitial extends TodoState {
  /// {@macro todoInitial}
  const TodoInitial();
}

/// {@template todoLoadSuccess}
/// Load success state.
/// {@endtemplate}
class TodoLoadSuccess extends TodoState {
  /// Default list of todos.
  final List<TodoItem> todoList;

  /// Filtered list of todos.
  final List<TodoItem> filteredTodoList;

  /// Current filter.
  final TodoFilterType currentFilter;

  /// {@macro todoLoadSuccess}
  const TodoLoadSuccess({
    required this.todoList,
    required this.filteredTodoList,
    required this.currentFilter,
  });

  @override
  List<Object> get props => [todoList, filteredTodoList, currentFilter];

  /// Current state update function.
  TodoLoadSuccess copyWith({
    List<TodoItem>? todoList,
    List<TodoItem>? filteredTodoList,
    TodoFilterType? currentFilter,
  }) =>
      TodoLoadSuccess(
        todoList: todoList ?? this.todoList,
        filteredTodoList: filteredTodoList ?? this.filteredTodoList,
        currentFilter: currentFilter ?? this.currentFilter,
      );
}

/// {@template todoLoadFailed}
/// Load failed state.
/// {@endtemplate}
class TodoLoadFailed extends TodoState {
  /// Error.
  final Object? error;

  /// {@macro todoLoadFailed}
  const TodoLoadFailed({this.error});
}
