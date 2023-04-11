import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupFailure {
  final String message;

  const SignupFailure([this.message = "An unknown error occurred."]);

  factory SignupFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignupFailure('Please enter a stronger password');
      case 'invalid-email':
        return const SignupFailure('Email is not valid');
      case 'email-already-in-use':
        return const SignupFailure('Email already been used');
      case 'operation-not-allowed':
        return const SignupFailure('Operation is not allowed');
      case 'user-disabled':
        return const SignupFailure('User is disabled');
      default:
        return const SignupFailure();
    }
  }
}
