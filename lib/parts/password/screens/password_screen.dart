part of password_part;

class PasswordScreen extends StatefulWidget {
  final String? password;

  const PasswordScreen({super.key, required this.password});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  String _newPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.password != null
                      ? 'Enter password'
                      : 'Create a password',
                ),
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if ((value?.length ?? 0) < 4) {
                      return 'Minimum password length 4 digits';
                    } else if (widget.password != null &&
                        widget.password != value) {
                      return 'Wrong password';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    if (value != null) {
                      _newPassword = value;
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: ElevatedButton(
                    onPressed: _onConfirm,
                    child: const Text('Confirm'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onConfirm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();
      if (FocusScope.of(context).hasFocus) FocusScope.of(context).unfocus();
      if (widget.password == null) {
        context.readPasswordCubit.savePassword(password: _newPassword);
      }
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const TodoPart()));
    }
  }
}
