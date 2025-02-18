import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/bloc/avatar_bloc.dart';
import 'package:movie_app/bloc/bloc_observer.dart';
import 'package:movie_app/bloc/language_bloc.dart';
import 'package:movie_app/core/di/di.dart';
import 'package:movie_app/core/utils/app_theme.dart';
import 'package:movie_app/features/ui/auth/login/forget_password_screen.dart';
import 'package:movie_app/features/ui/auth/login/login_screen.dart';
import 'package:movie_app/features/ui/auth/register/register_screen.dart';
import 'package:movie_app/features/ui/home/home_screen.dart';
import 'package:movie_app/features/ui/onBoarding/onboarding_screen.dart';
import 'package:movie_app/l10n/app_localizations.dart';

void main() {
  configureDependencies();
  // Bloc.observer = MyBlocObserver();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LanguageBloc()),
        BlocProvider(create: (context) => AvatarBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // initialRoute: OnboardingScreen.routeName,
          initialRoute: HomeScreen.routeName,
          routes: {
            OnboardingScreen.routeName: (context) => const OnboardingScreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
            ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
            RegisterScreen.routeName: (context) => RegisterScreen(),
            HomeScreen.routeName: (context) => const HomeScreen(),
          },
          theme: AppTheme.darkTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: context.watch<LanguageBloc>().state.locale,
        );
      },
    );
  }
}
