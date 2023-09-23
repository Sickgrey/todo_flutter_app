part of todo_part;

/// {@tempalte createTodoScreen}
/// Create todo screen.
/// {@endtempllate}
class CreateTodoScreen extends StatefulWidget {
  /// On create callback.
  final ValueChanged<String> onCreate;

  /// {@macro createTodoScreen}
  const CreateTodoScreen({super.key, required this.onCreate});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              autofocus: true,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: ElevatedButton(
                onPressed: () {
                  widget.onCreate(controller.text);
                  Navigator.of(context).pop();
                },
                child: const Text('Create'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
