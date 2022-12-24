
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(super.initialState){
    _addListeners();
  }

  void initiateSplash() {
    add(LoadSplash());
  }

  void _addListeners() {
    on((event, emit) async {
      emit(SplashLoading());
      //todo: add some actions like checking the connection etc.
      //I simulate the process with future delayed for 3 second
      await Future.delayed(const Duration(seconds: 3));
      emit(SplashCompleted());
    });
  }

}