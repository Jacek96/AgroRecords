part of 'my_records_cubit.dart';

@immutable
class MyRecordsState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const MyRecordsState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
