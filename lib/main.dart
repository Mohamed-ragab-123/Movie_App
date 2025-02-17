import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/language_bloc_manger.dart';
import 'package:movie_app/core/utils/app_theme.dart';
import 'package:movie_app/features/ui/auth/login/forget_password_screen.dart';
import 'package:movie_app/features/ui/auth/login/login_screen.dart';
import 'package:movie_app/features/ui/auth/register/register_screen.dart';
import 'package:movie_app/features/ui/home/home_screen.dart';
import 'package:movie_app/l10n/app_localizations.dart';
import 'features/ui/onBoarding/onboarding_screen.dart';
import 'features/ui/onBoarding/onboarding_screen2.dart';
import 'home.dart';


void main() {
  runApp(
    BlocProvider(
      create: (context) => LanguageBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OnboardingScreen.routeName,
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        OnboardingScreen2.routeName: (context) => const OnboardingScreen2(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        Home.routeName: (context) => const Home(),

      },
      theme: AppTheme.darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: context.watch<LanguageBloc>().state.locale,
    );
  }
}
