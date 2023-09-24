library password_part;

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_flutter_app/parts/todo/todo_part.dart';
import 'package:todo_flutter_app/ui_kit/ui_kit.dart';

part 'cubit/password_cubit.dart';
part 'cubit/password_state.dart';
part 'repository/i_password_repository.dart';
part 'repository/password_repository.dart';
part 'screens/password_screen.dart';

class PasswordPart extends StatelessWidget {
  const PasswordPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PasswordCubit>(
      create: (context) => PasswordCubit(
        passwordRepository: PasswordRepository(),
      )..fetchPassword(),
      child: BlocBuilder<PasswordCubit, PasswordState>(
        builder: (context, state) {
          if (state is PasswordLoadSuccess) {
            return PasswordScreen(password: state.password);
          } else if (state is PasswordLoadFailed) {
            return AppErrorScreen(error: state.error);
          } else {
            return const AppLoadingScreen();
          }
        },
      ),
    );
  }
}
