import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_clone_flutter/blocs/blocs.dart';
import 'package:insta_clone_flutter/config/custom_router.dart';
import 'package:insta_clone_flutter/repositories/repositories.dart';
import 'package:insta_clone_flutter/screens/screens.dart';
import 'package:insta_clone_flutter/theme.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //context.read<AuthRepository>(); //accessing bloc repository using context
    return MultiRepositoryProvider(
      //to access repository provider using context anywhere in the app
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (_) => AuthRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) =>
                AuthBloc(authRepository: context.read<AuthRepository>()),
          ),
        ],
        child: MaterialApp(
          title: 'Insta Clone',
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          // home: MyHomePage(title: 'Flutter Demo Home Page'),   home not needed as we are using named routes
          onGenerateRoute: CustomRouter
              .onGenerateRoute, //in order to use named routes and here settings not specified in function call as its passed automatically
          initialRoute: SplashScreen.routeName, //to specify initial route
        ),
      ),
    );
  }
}
