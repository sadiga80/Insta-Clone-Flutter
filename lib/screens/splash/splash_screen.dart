import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_clone_flutter/blocs/blocs.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  static const routeName = "/splash";

  static Route route() //route function to return a material page route
  {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          print(state);
          if (state.status == AuthStatus.unauthenticated) {
            //Goto login screen
          } else if (state.status == AuthStatus.authenticated) {
            //goto nav scren
          }
        },
        child: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
