import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  static Route route() {
    //to show login screen sliding over splash screen we are using page route builder instead of material route (to make screen appear on top of splash screen)
    return PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        transitionDuration: const Duration(seconds: 0),
        pageBuilder: (_, __, ___) => LoginScreen());
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), //un-focusing text-field
        child: Scaffold(
          resizeToAvoidBottomInset: false, //to avoid screen pushing up
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key:
                        _formKey, //to validate all the fields in form by accessing form key and calling validate
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment:
                          CrossAxisAlignment.stretch, //stretch to entire screen
                      mainAxisSize: MainAxisSize.min, //size of the card
                      children: [
                        const Text(
                          "Instagram",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(hintText: 'Email '),
                          onChanged: (value) => print(value),
                          validator: (value) => !value.contains('@')
                              ? 'Please enter a valid email.'
                              : null,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(hintText: 'Password '),
                          obscureText: true,
                          onChanged: (value) => print(value),
                          validator: (value) => value.length < 6
                              ? 'Must be at least 6 characters.'
                              : null,
                        ),
                        const SizedBox(
                          height: 28.0,
                        ),
                        ElevatedButton(
                          onPressed: () => print('login'),
                          child: const Text('Log in'),
                          style: ElevatedButton.styleFrom(elevation: 1.0),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        ElevatedButton(
                          onPressed: () => print('Navigate to sign up screen'),
                          child: const Text(
                            'No account? Sign up',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 1.0,
                            primary: Colors.grey[200],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
