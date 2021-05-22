import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRouter //used to handle routing in the app
{
  static Route onGenerateRoute(
      RouteSettings
          settings) //settings have name and args . To check the name for routing
  {
    switch (settings.name) {
      case '/':
        MaterialPageRoute(
          settings: const RouteSettings(
              name:
                  '/'), //reason to specify route setting here is to look into analytics where user goes to
          builder: (_) => const Scaffold(),
        );

      default:
        _errorRoute();
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
