// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class LocalAuthApi {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException {
      return false;
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;

    try {
      return await _auth.authenticate(
        localizedReason: 'Scan Face to Authenticate',
        authMessages: const <AuthMessages>[
          IOSAuthMessages(),
          AndroidAuthMessages(
            signInTitle: 'Face ID Required',
            biometricHint: 'biometricHint',
          )
        ],
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          sensitiveTransaction: true,
          biometricOnly: false,
        ),
      );
    } on PlatformException {
      return false;
    }
  }
}
