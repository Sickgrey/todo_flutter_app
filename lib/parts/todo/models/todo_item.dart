part of '../todo_part.dart';

/// {@template todoItem}
/// Model of todo item.
/// {@endtemplate}
class TodoItem extends Equatable {
  final String id;
  final bool completed;
  final int order;
  final String title;
  final String url;

  /// {@macro todoItem}
  const TodoItem({
    required this.id,
    required this.completed,
    required this.order,
    required this.title,
    required this.url,
  });

  /// Convert to [TodoItem] from [DtoTodoItem].
  factory TodoItem.fromDto(DtoTodoItem dto) => TodoItem(
        id: dto.id,
        completed: dto.completed,
        order: dto.order,
        title: dto.title,
        url: dto.url,
      );

  /// Convert to [DtoTodoItem] from [TodoItem].
  DtoTodoItem toDto() => DtoTodoItem(
        id: id,
        completed: completed,
        order: order,
        title: title,
        url: url,
      );

  /// [TodoItem] update function.
  TodoItem copyWith({
    String? id,
    bool? completed,
    int? order,
    String? title,
    String? url,
  }) =>
      TodoItem(
        id: id ?? this.id,
        completed: completed ?? this.completed,
        order: order ?? this.order,
        title: title ?? this.title,
        url: url ?? this.url,
      );

  @override
  List<Object?> get props => [id, completed, order, title, url];
}
