
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc_examples/covid_status_example/covid_status_screen.dart';
import 'splash_bloc.dart';


class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashBloc _splashBloc = SplashBloc(SplashInitiated());

  @override
  void initState() {
    // _splashBloc.add(LoadSplash());
    _splashBloc.initiateSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue,
        child: BlocProvider(
          create: (_) => _splashBloc,
          child: BlocListener<SplashBloc, SplashState>(
            listener: (context, state) {
              if (state is SplashCompleted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => CovidStatusScreen()
                  ),
                );
              }
            },
            child: _buildSplashWidget(),
          ),
        ),
      ),
    );
  }

  Widget _buildSplashWidget() {
    return const Center(
      child: Text(
        "Logo Splash",
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );
  }
}