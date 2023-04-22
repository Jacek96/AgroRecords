part of 'login_cubit.dart';

@immutable
class LoginState {
  final String errorMessage;
  final bool isLoading;

  const LoginState({required this.errorMessage, required this.isLoading});
}
