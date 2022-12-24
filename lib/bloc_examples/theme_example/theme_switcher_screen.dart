import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc_examples/theme_example/theme_bloc.dart';

class ThemeSwitcherScreen extends StatelessWidget {
  const ThemeSwitcherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeData>(
      builder: (_, theme) {
        return MaterialApp(
          theme: theme,
          home:  Scaffold(
            appBar: AppBar(title: const Text('Theme Swtcher Page'),),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.brightness_6),
              onPressed: () {
                context.read<ThemeBloc>().toggleTheme();
              },
            )
          ),
        );
      },
    );
  }
}
