import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc_examples/counter_exapmle/counter_page.dart';
import 'package:flutter_bloc_example/bloc_examples/covid_status_example/covid_status_screen.dart';
import 'package:flutter_bloc_example/bloc_examples/splash_screen/splash_screen.dart';
import 'package:flutter_bloc_example/bloc_examples/theme_example/theme_switcher_screen.dart';
import 'app.dart';
import 'app_bloc_observer.dart';
import 'bloc_examples/theme_example/theme_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const App());
}
