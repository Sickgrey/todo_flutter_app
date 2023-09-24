part of '../todo_part.dart';

@JsonSerializable()
class DtoTodoItem {
  final String id;
  final bool completed;
  final int order;
  final String title;
  final String url;

  const DtoTodoItem({
    required this.id,
    required this.completed,
    required this.order,
    required this.title,
    required this.url,
  });

  /// [DtoTodoItem.fromJson].
  factory DtoTodoItem.fromJson(Map<String, dynamic> json) =>
      _$DtoTodoItemFromJson(json);

  /// [DtoTodoItem] to json.
  Map<String, dynamic> toJson() => _$DtoTodoItemToJson(this);
}
