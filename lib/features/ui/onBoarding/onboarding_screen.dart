
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/assets_manger.dart';
import 'package:google_fonts/google_fonts.dart';

import 'onboarding_screen2.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  static const String routeName = "OnboardingScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AssetManger.onBoarding1,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 32,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Text(
                  'Find Your Next Favorite Movie Here',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: AppColors.whiteColor,
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                 Text(
                  'Get access to a huge library of movies to suit all tastes. You will surely like it.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: AppColors.whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, OnboardingScreen2.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.yellowColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child:  Text(
                      'Explore Now',
                      style: GoogleFonts.inter(
                        color: AppColors.blackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
