//bloc to continuously print in debug console
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  Future<void> onError(Cubit cubit, Object error, StackTrace stackTrace) async {
    print(error);
    super.onError(cubit, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) { //inoked when a bloc is changing from one state to another state
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onEvent(Bloc bloc, Object event) { //Invoked when a new event is added to bloc
    print(event);
    super.onEvent(bloc, event);
  }
}
