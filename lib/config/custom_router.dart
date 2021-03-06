import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone_flutter/screens/screens.dart';

class CustomRouter //used to handle routing in the app
{
  static Route onGenerateRoute(
      RouteSettings
          settings) //settings have name and args . To check the name for routing
  {
    print("Route : ${settings.name}");
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: const RouteSettings(
              name:
                  '/'), //reason to specify route setting here is to look into analytics where user goes to
          builder: (_) => const Scaffold(),
        );
      case SplashScreen.routeName:
        return SplashScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case NavScreen.routeName:
        return NavScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
        body: const Center(
          child: Text("Something went wrong!"),
        ),
      ),
    );
  }
}
