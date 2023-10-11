import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final LocalAuthentication localAuth = LocalAuthentication();

  Future<void> authenticateFingerprint() async {
    try {
      bool canCheckBiometrics = await localAuth.canCheckBiometrics;
      List<BiometricType> availableBiometrics = await localAuth.getAvailableBiometrics();

      if (canCheckBiometrics && availableBiometrics.contains(BiometricType.fingerprint)) {
        bool authenticated = await localAuth.authenticate(
          localizedReason: 'Authenticate to access the app',
        );

        if (authenticated) {
          // Fingerprint authentication successful
          // You can navigate to the main content of your app here
          // For simplicity, we'll just show a success message.
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Success'),
                content: Text('Fingerprint authentication successful.'),
                actions: <Widget>[
                  GestureDetector(
                    child: Text('OK'),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        } else {
          // Fingerprint authentication failed
          // Handle the failure, show an error message, etc.
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('Fingerprint authentication failed.'),
                actions: <Widget>[
                  GestureDetector(
                    child: Text('OK'),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      } else {
        // Fingerprint is not available on this device
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Fingerprint is not available on this device.'),
              actions: <Widget>[
                GestureDetector(
                  child: Text('OK'),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      // Handle any exceptions
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Replace this with your login logic
                // For this example, we'll authenticate with fingerprint
                authenticateFingerprint();
              },
              child: Text('Authenticate with Fingerprint'),
            ),
          ],
        ),
      ),
    );
  }
}
