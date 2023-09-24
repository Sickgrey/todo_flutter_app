part of password_part;

/// {@template passwordCubit}
/// Password part control cubit.
/// {@endtemplate}
class PasswordCubit extends Cubit<PasswordState> {
  /// Instance of [IPasswordRepository].
  final IPasswordRepository passwordRepository;

  /// {@macro passwordCubit}
  PasswordCubit({required this.passwordRepository})
      : super(const PasswordInitial());

  Future<void> fetchPassword() async {
    try {
      final password = await passwordRepository.fetchPassword();
      emit(PasswordLoadSuccess(password: password));
    } catch (e) {
      emit(PasswordLoadFailed(error: e));
    }
  }

  Future<void> savePassword({required String password}) async {
    try {
      await passwordRepository.savePassword(password: password);
    } catch (e) {
      emit(PasswordLoadFailed(error: e));
    }
  }
}

/// Context extension for quick access to [PasswordCubit].
extension PasswordCubitBuildContextX on BuildContext {
  /// Instance of [PasswordCubit].
  PasswordCubit get readPasswordCubit => read<PasswordCubit>();
}
