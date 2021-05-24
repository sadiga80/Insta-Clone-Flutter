import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  static const String routeName = '/login';

  static Route route() { //to show login screen sliding over splash screen we are using page route builder instead of material route (to make screen appear on top of splash screen)
    return PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        transitionDuration: const Duration(seconds: 0),
        pageBuilder: (_, __, ___) => LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Login Screen'),
    );
  }
}
