import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'my_records_state.dart';

class MyRecordsCubit extends Cubit<MyRecordsState> {
  MyRecordsCubit()
      : super(
          const MyRecordsState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const MyRecordsState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('records')
        .snapshots()
        .listen((data) {
      emit(
        MyRecordsState(
          // documents: data.docs,
          documents: data.docs,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          MyRecordsState(
            documents: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  Future<void> myEvent({required String documentId}) async {
    FirebaseFirestore.instance.collection('records').doc(documentId).delete();
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
