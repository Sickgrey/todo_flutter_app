part of todo_part;

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
        itemBuilder: (context) => const [
          PopupMenuItem(
            value: TodoFilterType.all,
            padding: EdgeInsets.symmetric(horizontal: 8),
            height: 32,
            child: Text(
              'All',
            ),
          ),
          PopupMenuDivider(height: 1),
          PopupMenuItem(
            value: TodoFilterType.completed,
            padding: EdgeInsets.symmetric(horizontal: 8),
            height: 32,
            child: Text(
              'Completed',
            ),
          ),
          PopupMenuDivider(height: 1),
          PopupMenuItem(
            value: TodoFilterType.uncompleted,
            padding: EdgeInsets.symmetric(horizontal: 8),
            height: 32,
            child: Text(
              'Uncompleted',
            ),
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
}
