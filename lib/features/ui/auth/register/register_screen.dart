import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/avatar_bloc.dart';
import 'package:movie_app/bloc/language_bloc.dart';
import 'package:movie_app/core/di/di.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/assets_manger.dart';
import 'package:movie_app/core/utils/dialog_utils.dart';
import 'package:movie_app/features/ui/auth/login/login_screen.dart';
import 'package:movie_app/features/ui/auth/register/cubit/register_states.dart';
import 'package:movie_app/features/ui/auth/register/cubit/register_view_model.dart';
import 'package:movie_app/l10n/app_localizations.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "RegisterScreen";

  RegisterScreen({super.key});

  final List<String> sliderImages = [
    AssetManger.avatarOne,
    AssetManger.avatarTwo,
    AssetManger.avatarThree,
    AssetManger.avatarFour,
    AssetManger.avatarFive,
    AssetManger.avatarSix,
    AssetManger.avatarSeven,
    AssetManger.avatarEight,
    AssetManger.avatarNine,
  ];
  RegisterViewModel viewModel = getIt<RegisterViewModel>();
  int selectedAvatarIndex = getIt<int>();


  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoding(context: context, message: "Loading.......");
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showLoding(
              context: context,
              message: state.errors.errorMessage,
              posActionName: " OK",
              title: "Error");
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showLoding(
              context: context,
              message: "Register Successfully.",
              posActionName: " OK",
              title: "Success");
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        appBar: AppBar(
          backgroundColor: AppColors.blackColor,
          title: Text(
            AppLocalizations.of(context).register,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: AppColors.yellowColor),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: AppColors.yellowColor),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 161,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    viewportFraction: 0.45,
                    aspectRatio: 16 / 9,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                  ),
                  items: sliderImages.map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Transform.scale(
                          scale: 1.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
                Text(
                  "Avatar",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: AppColors.whiteColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: viewModel.nameController,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: AppColors.whiteColor),
                  decoration: InputDecoration(
                    fillColor: AppColors.greyColor,
                    filled: true,
                    labelText: AppLocalizations.of(context).name,
                    labelStyle: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: AppColors.whiteColor),
                    prefixIcon: const ImageIcon(
                        AssetImage(AssetManger.iconName),
                        color: AppColors.whiteColor),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2, color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: viewModel.emailController,
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
                      borderSide: const BorderSide(
                          width: 2, color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2, color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2, color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: viewModel.passwordController,
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
                      borderSide: const BorderSide(
                          width: 2, color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2, color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2, color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: viewModel.confirmPasswordController,
                  obscureText: true,
                  obscuringCharacter: "#",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: AppColors.whiteColor),
                  decoration: InputDecoration(
                    fillColor: AppColors.greyColor,
                    filled: true,
                    labelText: AppLocalizations.of(context).confirmPassword,
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
                      borderSide: const BorderSide(
                          width: 2, color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2, color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2, color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: viewModel.phoneNumberController,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: AppColors.whiteColor),
                  decoration: InputDecoration(
                    fillColor: AppColors.greyColor,
                    filled: true,
                    labelText: AppLocalizations.of(context).phoneNumber,
                    labelStyle: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: AppColors.whiteColor),
                    prefixIcon: const ImageIcon(
                      AssetImage(AssetManger.iconPhoneNumber),
                      color: AppColors.whiteColor,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2, color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2, color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2, color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const SizedBox(height: 24),
                BlocBuilder<AvatarBloc, AvatarState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        print(
                            "Selected Avatar Index: ${viewModel.selectedAvatarIndex}");
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        backgroundColor: AppColors.yellowColor,
                      ),
                      child: Text(
                        AppLocalizations.of(context).createAccount,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: AppColors.blackColor),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                  child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: AppLocalizations.of(context).alreadyHaveAccount,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: AppColors.whiteColor),
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context).login,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                color: AppColors.yellowColor,
                                fontWeight: FontWeight.w900,
                                decoration: TextDecoration.underline,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
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
      ),
    );
  }
}
