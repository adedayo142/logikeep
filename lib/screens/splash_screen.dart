import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logi_keep/screens/onboarding/onboarding_one.dart';
import 'package:logi_keep/utils/app_assets.dart';
import 'package:logi_keep/utils/app_colors.dart';
import 'package:logi_keep/widgets/buttons.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/splash_screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkForInternet();
    Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => OnBoardingOne()));
    });
  }

  Future<void> _checkForInternet() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (!result) {
      _showSnackBar();
    }
  }

  void _showSnackBar() {
    SnackBar(
      content: Text("No Internet Connection"),
      backgroundColor: kPrimaryRed,
    );
    //   CustomSnackBar.showGet(
    //       title: 'Error!',
    //       content: 'No Internet Connection',
    //       backgroundColor: kPrimaryRed,
    //       textColor: kPrimaryText);
     }

    void navigate() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnBoardingOne()));
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (BuildContext context) => OnBoardingOne()),
      //     (route) => false);
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(builder: (BuildContext context) => OnBoardingOne()),
      //     (route) => false);
      //Get.offNamedUntil(OnBoardingOne.route, (route) => false);
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: kPrimaryBlue,
          body: Column(
            children: [
              Expanded(
                child: Center(
                    child: Image.asset(
                  Assets.logoImage,
                  width: 200,
                  height: 200,
                )
                    // SvgPicture.asset(
                    //   Assets.logoImage,
                    //   width: 80.w,
                    //   height: 80.h,
                    // ),
                    ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 25.w, left: 25.w, bottom: 25.h),
                child: PrimaryButton(
                  onPressed: () => navigate(),
                  backgroundColor: Colors.white,
                  text: 'GET STARTED',
                ),
              )
            ],
          ));

  }
}
