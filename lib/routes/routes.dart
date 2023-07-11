import 'package:flutter/material.dart';
import 'package:logi_keep/screens/auth/login.dart';
import 'package:logi_keep/screens/auth/register.dart';
import 'package:logi_keep/screens/onboarding/onboarding_one.dart';
import 'package:logi_keep/screens/onboarding/onboarding_three.dart';
import 'package:logi_keep/screens/onboarding/onboarding_two.dart';
import 'package:logi_keep/screens/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

Route? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.route:
      return PageTransition(
          child: const SplashScreen(), type: PageTransitionType.rightToLeft);
    case OnBoardingOne.route:
      return PageTransition(
          child: const OnBoardingOne(), type: PageTransitionType.rightToLeft);
    case OnboardingTwo.route:
      return PageTransition(
          child: const OnboardingTwo(), type: PageTransitionType.rightToLeft);
    case OnboardingThree.route:
      return PageTransition(
          child: const OnboardingThree(), type: PageTransitionType.rightToLeft);
    case RegisterView.route:
      return PageTransition(
          child: const RegisterView(), type: PageTransitionType.rightToLeft);
    case LoginView.route:
      return PageTransition(
          child: const LoginView(), type: PageTransitionType.rightToLeft);
  }
}
