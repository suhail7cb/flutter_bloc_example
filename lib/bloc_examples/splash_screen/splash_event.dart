
part of 'splash_bloc.dart';

@immutable
abstract class SplashEvent {}

class LoadSplash extends SplashEvent {}

class SplashInProgress extends SplashEvent {}

class FinishSplash extends SplashEvent {}