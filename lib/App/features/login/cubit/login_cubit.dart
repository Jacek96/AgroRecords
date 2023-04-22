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
          ),
        );
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const LoginState(
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('records')
        .snapshots()
        .listen((data) {
      emit(
        const LoginState(
          errorMessage: '',
          isLoading: false,
        ),
      );
    })
      ..onError((error) {
        emit(
          LoginState(
            errorMessage: error.toString(),
            isLoading: false,
          ),
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
