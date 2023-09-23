// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DtoTodoItem _$DtoTodoItemFromJson(Map<String, dynamic> json) => DtoTodoItem(
      id: json['id'] as String,
      completed: json['completed'] as bool,
      order: json['order'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$DtoTodoItemToJson(DtoTodoItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'completed': instance.completed,
      'order': instance.order,
      'title': instance.title,
      'url': instance.url,
    };
