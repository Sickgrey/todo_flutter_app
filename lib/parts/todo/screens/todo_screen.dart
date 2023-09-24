part of todo_part;

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo list'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const TodoFilter(),
          ),
        ],
      ),
      body: todoList.isEmpty
          ? const Center(
              child: Text('Empty data'),
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
                        label: 'Delete',
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
                      onChanged: (value) => context.readTodoCubit
                          .switchCompleteStatus(id: todoItem.id),
                    ),
                    onTap: () => context.readTodoCubit
                        .switchCompleteStatus(id: todoItem.id),
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
