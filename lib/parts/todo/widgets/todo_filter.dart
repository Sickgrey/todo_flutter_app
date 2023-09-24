part of '../todo_part.dart';

/// {@tempalte todoFilter}
/// Button with popup menu for filter.
/// {@endtempllate}
class TodoFilter extends StatelessWidget {
  /// {@macro todoFilter}
  const TodoFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) => PopupMenuButton<TodoFilterType>(
        initialValue: state is TodoLoadSuccess ? state.currentFilter : null,
        itemBuilder: (context) => [
          PopupMenuItem(
            value: TodoFilterType.all,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: 32,
            child: Text(capitalize(TodoFilterType.all.name)),
          ),
          const PopupMenuDivider(height: 1),
          PopupMenuItem(
            value: TodoFilterType.completed,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: 32,
            child: Text(capitalize(TodoFilterType.completed.name)),
          ),
          const PopupMenuDivider(height: 1),
          PopupMenuItem(
            value: TodoFilterType.uncompleted,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: 32,
            child: Text(capitalize(TodoFilterType.uncompleted.name)),
          ),
        ],
        onSelected: (value) {
          context.readTodoCubit.filterTodos(value);
        },
        padding: const EdgeInsets.symmetric(horizontal: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(Icons.filter_alt),
      ),
    );
  }

  String capitalize(String text) =>
      text.isEmpty ? text : '${text[0].toUpperCase()}${text.substring(1)}';
}
