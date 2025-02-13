import 'package:flutter/material.dart';

abstract class LanguageEvent {}

class ToggleLanguage extends LanguageEvent {}

abstract class LanguageState {
  final Locale locale;

  LanguageState(this.locale);
}

class LanguageInitial extends LanguageState {
  LanguageInitial() : super(const Locale('en'));
}

class LanguageChanged extends LanguageState {
  LanguageChanged(super.locale);
}
