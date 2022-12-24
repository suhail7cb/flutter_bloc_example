import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc_examples/counter_exapmle/counter_screen.dart';
import 'package:flutter_bloc_example/bloc_examples/splash_screen/splash_screen.dart';

import 'bloc_examples/counter_exapmle/counter_page.dart';
import 'bloc_examples/theme_example/theme_bloc.dart';
import 'bloc_examples/theme_example/theme_switcher_screen.dart';

class App extends StatelessWidget {
  /// {@macro app}
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeBloc(),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeData>(
        builder: (_, theme) {
          return MaterialApp(
            theme: theme,
              // home: SplashScreen()
            // home: const ThemeSwitcherScreen(),
            home: const CounterPage(),
          );

        }
    );
  }
}