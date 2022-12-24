
part of 'splash_bloc.dart';

@immutable
abstract class SplashState {}

class SplashInitiated extends SplashState {}

class SplashLoading extends SplashState {}

class SplashCompleted extends SplashState {}