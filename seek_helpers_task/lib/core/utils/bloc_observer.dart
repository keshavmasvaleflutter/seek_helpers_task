import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

class CusotmBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('${bloc.runtimeType} $change');
  }

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    super.onTransition(bloc, transition);
    log('${bloc.runtimeType} $transition');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log('${bloc.runtimeType} $error $stackTrace');
  }
  
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('${bloc.runtimeType} created');
  }
}