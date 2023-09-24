library todo_part;

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:todo_flutter_app/l10n/l10n.dart';
import 'package:todo_flutter_app/ui_kit/ui_kit.dart';

part 'todo_part.g.dart';

part 'cubit/todo_cubit.dart';
part 'cubit/todo_state.dart';
part 'data_provider/i_todo_data_provider.dart';
part 'data_provider/todo_data_provider.dart';
part 'models/dto_todo_item.dart';
part 'models/todo_filter_type.dart';
part 'models/todo_item.dart';
part 'repository/i_todo_repository.dart';
part 'repository/todo_repository.dart';
part 'screens/create_todo_screen.dart';
part 'screens/todo_screen.dart';
part 'widgets/todo_filter.dart';

class TodoPart extends StatelessWidget {
  const TodoPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoCubit>(
      create: (_) => TodoCubit(
        todoRepository: TodoRepository(
          todoDataProvider: TodoDataProvider(),
        ),
      )..fetchTodos(),
      child: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state is TodoLoadSuccess) {
            return TodoScreen(todoList: state.filteredTodoList);
          } else if (state is TodoLoadFailed) {
            return AppErrorScreen(error: state.error);
          } else {
            return const AppLoadingScreen();
          }
        },
      ),
    );
  }
}
