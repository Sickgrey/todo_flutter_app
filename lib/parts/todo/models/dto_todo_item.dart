part of '../todo_part.dart';

/// {@template dtoTodoItem}
/// Dto model of todo item.
/// {@endtemplate}
@JsonSerializable()
class DtoTodoItem {
  final String id;
  final bool completed;
  final int order;
  final String title;
  final String url;

  /// {@macro dtoTodoItem}
  const DtoTodoItem({
    required this.id,
    required this.completed,
    required this.order,
    required this.title,
    required this.url,
  });

  /// Convert to [DtoTodoItem] from json.
  factory DtoTodoItem.fromJson(Map<String, dynamic> json) =>
      _$DtoTodoItemFromJson(json);

  /// Convert to json from [DtoTodoItem].
  Map<String, dynamic> toJson() => _$DtoTodoItemToJson(this);
}
