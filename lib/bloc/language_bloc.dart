import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

// ----- [ Events ] -----
abstract class LanguageEvent extends Equatable {
  const LanguageEvent();
  @override
  List<Object> get props => [];
}

// تبديل اللغة بين العربية والإنجليزية
class ToggleLanguage extends LanguageEvent {}

// ----- [ State ] -----
abstract class LanguageState extends Equatable {
  final Locale locale;
  const LanguageState(this.locale);

  @override
  List<Object> get props => [locale];
}

class LanguageInitial extends LanguageState {
  LanguageInitial() : super(const Locale('en'));
}

class LanguageChanged extends LanguageState {
  const LanguageChanged(Locale locale) : super(locale);
}

// ----- [ BLoC ] -----
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial()) {
    on<ToggleLanguage>((event, emit) {
      final newLocale =
      (state.locale.languageCode == 'en') ? const Locale('ar') : const Locale('en');
      emit(LanguageChanged(newLocale));
    });
  }
}
