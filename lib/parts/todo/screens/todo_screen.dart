part of '../todo_part.dart';

/// {@template todoScreen}
/// Screen with list of todo items.
/// {@endtemplate}
class TodoScreen extends StatelessWidget {
  /// List of todo items.
  final List<TodoItem> todoList;

  /// {@macro todoScreen}
  const TodoScreen({super.key, required this.todoList});

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.todoList),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const TodoFilter(),
          ),
        ],
      ),
      body: todoList.isEmpty
          ? Center(
              child: Text(locale.emptyData),
            )
          : ListView.separated(
              itemBuilder: (context, index) {
                final todoItem = todoList[index];

                return Slidable(
                  endActionPane: ActionPane(
                    motion: const BehindMotion(),
                    extentRatio: 0.3,
                    children: [
                      SlidableAction(
                        icon: Icons.delete,
                        label: locale.delete,
                        backgroundColor: Colors.red,
                        onPressed: (context) => context.readTodoCubit
                            .deleteTodo(todoUrl: todoItem.url),
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(
                      todoItem.title,
                      style: todoItem.completed
                          ? const TextStyle(
                              decoration: TextDecoration.lineThrough,
                            )
                          : null,
                    ),
                    leading: Checkbox(
                      value: todoItem.completed,
                      onChanged: (value) =>
                          context.readTodoCubit.updateCompleteStatus(
                        todoUrl: todoItem.url,
                        isCompleted: !todoItem.completed,
                      ),
                    ),
                    onTap: () => context.readTodoCubit.updateCompleteStatus(
                      todoUrl: todoItem.url,
                      isCompleted: !todoItem.completed,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: todoList.length,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => CreateTodoScreen(
                onCreate: (title) =>
                    context.readTodoCubit.createTodo(title: title),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
