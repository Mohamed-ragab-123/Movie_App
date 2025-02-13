// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movie_app/bloc/language_bloc.dart';
//
//
// class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
//   LanguageBloc() : super(LanguageInitial()) {
//     on<ToggleLanguage>((event, emit) {
//       final newLocale =
//           (state.locale.languageCode == 'en') ? const Locale('ar') : const Locale('en');
//       emit(LanguageChanged(newLocale));
//     });
//   }
// }
