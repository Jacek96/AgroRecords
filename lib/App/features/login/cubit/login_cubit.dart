import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(
          const LoginState(
            errorMessage: '',
            isLoading: false,
            documents: [],
          ),
        );
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const LoginState(errorMessage: '', isLoading: true, documents: []),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('records')
        .snapshots()
        .listen((data) {
      emit(
        LoginState(
          errorMessage: '',
          isLoading: false,
          documents: data.docs,
        ),
      );
    })
      ..onError((error) {
        emit(
          LoginState(
              errorMessage: error.toString(),
              isLoading: false,
              documents: const []),
        );
      });
  }

  Future<void> createUser(
      {required String email, required String password}) async {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signIn({required String email, required String password}) async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }
}
