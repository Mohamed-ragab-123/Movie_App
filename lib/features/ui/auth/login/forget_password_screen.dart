import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/assets_manger.dart';
import 'package:movie_app/l10n/app_localizations.dart';


class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = "forgetPasswordScreen";

  ForgetPasswordScreen({super.key});

  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        title: Text(
          AppLocalizations.of(context).forgetPassword,
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
              Image.asset(
                AssetManger.forgetPassword,
                width: double.infinity,
                fit: BoxFit.fill,
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
                  AppLocalizations.of(context).verifyEmail,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: AppColors.blackColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
