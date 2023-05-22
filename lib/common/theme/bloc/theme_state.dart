// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class SystemTheme extends ThemeState {}

class DarkTheme extends ThemeState {}

class LightTheme extends ThemeState {}
