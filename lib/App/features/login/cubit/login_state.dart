part of 'login_cubit.dart';

@immutable
class LoginState {
  final String errorMessage;
  final bool isLoading;
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;

  const LoginState(
      {required this.errorMessage,
      required this.isLoading,
      required this.documents});
}
