import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class LoginAuth extends StatefulWidget {
  const LoginAuth({Key? key}) : super(key: key);

  @override
  State<LoginAuth> createState() => _LoginAuthState();
}

class _LoginAuthState extends State<LoginAuth> {
  late final LocalAuthentication auth;
  bool _supportState = false;

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isSupported) {
      setState(() {
        _supportState = isSupported;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login screen"),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.fingerprint,
                size: 30.0,
              ),
              onPressed: () async {
                bool authenticated = await Authentication().authentication();
                if (authenticated) {
                  debugPrint('Authentication successful');
                  Get.offAllNamed('/dashboard');
                } else {
                  debugPrint('Authentication failed');
                }
              },
              label: const Text('Authenticate'),
            ),
          ],
        ),
      ),
    );
  }
}

class Authentication {
  final _auth = LocalAuthentication();

  Future<bool> canAuthenticate() async {
    return await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
  }

  Future<bool> authentication() async {
    try {
      if (!await canAuthenticate()) return false;
      return await _auth.authenticate(
          localizedReason: 'Authenticate to access the app');
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
