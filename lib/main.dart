import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_app/parts/todo/todo_part.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<TodoCubit>(
        create: (_) => TodoCubit(
          todoRepository: TodoRepository(
            todoDataProvider: TodoDataProvider(),
          ),
        )..fetchTodos(),
        child: const TodoPart(),
      ),
    );
  }
}
