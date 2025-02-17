import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/language_bloc.dart';
import 'package:movie_app/bloc/language_bloc_manger.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/assets_manger.dart';
import 'package:movie_app/features/ui/auth/login/forget_password_screen.dart';
import 'package:movie_app/features/ui/auth/register/register_screen.dart';
import 'package:movie_app/l10n/app_localizations.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = "loginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 67),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AssetManger.logo,
                height: 150,
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: emailController,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: AppColors.whiteColor),
                decoration: InputDecoration(
                  fillColor: AppColors.greyColor,
                  filled: true,
                  labelText: AppLocalizations.of(context).email,
                  labelStyle: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: AppColors.whiteColor),
                  prefixIcon: const ImageIcon(
                    AssetImage(AssetManger.iconEmail),
                    color: AppColors.whiteColor,
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                    const BorderSide(width: 2, color: AppColors.whiteColor),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(width: 2, color: AppColors.greyColor),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(width: 2, color: AppColors.greyColor),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                obscuringCharacter: "#",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: AppColors.whiteColor),
                decoration: InputDecoration(
                  fillColor: AppColors.greyColor,
                  filled: true,
                  labelText: AppLocalizations.of(context).password,
                  labelStyle: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: AppColors.whiteColor),
                  prefixIcon: const ImageIcon(
                    AssetImage(AssetManger.iconPassword),
                    color: AppColors.whiteColor,
                  ),
                  suffixIcon: const ImageIcon(
                    AssetImage(AssetManger.iconEyeOff),
                    color: AppColors.whiteColor,
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                    const BorderSide(width: 2, color: AppColors.greyColor),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(width: 2, color: AppColors.greyColor),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(width: 2, color: AppColors.greyColor),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
                },
                child: Text(
                  AppLocalizations.of(context).forgetPassword,
                  textAlign: TextAlign.end,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: AppColors.yellowColor),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, HomeScreen.routeName);
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: AppColors.yellowColor),
                child: Text(
                  AppLocalizations.of(context).login,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: AppColors.blackColor),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RegisterScreen.routeName);
                },
                child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(children: [
                      TextSpan(
                          text: AppLocalizations.of(context).dontHaveAccount,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: AppColors.whiteColor)),
                      TextSpan(
                        onEnter: (event) {},
                        text: AppLocalizations.of(context).createOne,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                            color: AppColors.yellowColor,
                            fontSize: 18,
                            decoration: TextDecoration.underline),
                      ),
                    ])),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 10,
                      thickness: 1,
                      color: AppColors.yellowColor,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context).or,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: AppColors.yellowColor),
                  ),
                  const Expanded(
                    child: Divider(
                      indent: 10,
                      thickness: 1,
                      endIndent: 40,
                      color: AppColors.yellowColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                width: 361,
                height: 58,
                decoration: BoxDecoration(
                  color: AppColors.yellowColor,
                  border: Border.all(width: 1, color: AppColors.yellowColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide.none,
                  ),
                  icon: const ImageIcon(
                    AssetImage(AssetManger.iconGoogle),
                    color: AppColors.blackColor,
                  ),
                  label: Text(
                    AppLocalizations.of(context).loginWithGoogle,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.blackColor),
                  ),
                ),
              ),
              const SizedBox(height: 33.6),
              BlocBuilder<LanguageBloc, LanguageState>(
                builder: (context, state) {
                  bool isEnglish = state.locale.languageCode == 'en';
                  return GestureDetector(
                    onTap: () {
                      context.read<LanguageBloc>().add(ToggleLanguage());
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 90,
                          height: 39,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.black,
                            border: Border.all(
                              color: Colors.grey[800]!,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 35,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isEnglish
                                      ? AppColors.yellowColor
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: isEnglish
                                        ? AppColors.yellowColor
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    AssetManger.iconUsaFlag,
                                  ),
                                ),
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 35,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: !isEnglish
                                      ? AppColors.yellowColor
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: !isEnglish
                                        ? AppColors.yellowColor
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    AssetManger.iconEgyFlag,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
