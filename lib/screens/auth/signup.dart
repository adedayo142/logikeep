import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:logi_keep/providers/auth_provider.dart';
import 'package:logi_keep/utils/app_assets.dart';
import 'package:logi_keep/utils/app_colors.dart';
import 'package:logi_keep/widgets/text.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController countryIdController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    TextEditingController firstNameController =
        TextEditingController(text: auth.firstName);
    TextEditingController lastNameController =
        TextEditingController(text: auth.lastName);
    TextEditingController emailController =
        TextEditingController(text: auth.email);
    TextEditingController phoneNumberController =
        TextEditingController(text: auth.phone);
    TextEditingController countryIdController =
        TextEditingController(text: auth.country);
    TextEditingController passwordController =
        TextEditingController(text: auth.password);
    TextEditingController confirmPasswordController =
        TextEditingController(text: auth.confirmPassword);
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    countryIdController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     final auth = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: auth.isLoaded ? Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: auth.formKey,
            child: Column(
              children: [
                Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(top: 20),
                            child: Image.asset(Assets.topIconImage)),
                        Gap(50.h),
                        MyText(
                          'Sign Up',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800,
                          color: kPrimaryText,
                        ),
                        Gap(30.h),
              ],
            ),
          ),
        ),
      )
      : Center(
                child: SizedBox(
                  height: 30.r,
                  width: 30.r,
                  child: const CircularProgressIndicator(
                    color: kPrimaryBlue,
                  ),
                ),
              )
    );
  }
}
