import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:logi_keep/models/countries.dart';
import 'package:logi_keep/providers/auth_provider.dart';
import 'package:logi_keep/utils/app_assets.dart';
import 'package:logi_keep/utils/app_colors.dart';
import 'package:logi_keep/utils/constants.dart';
import 'package:logi_keep/widgets/buttons.dart';
import 'package:logi_keep/widgets/drop_down_widget.dart';
import 'package:logi_keep/widgets/inputs.dart';
import 'package:logi_keep/widgets/text.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class RegisterView extends StatefulWidget {
  static const String route = '/register_view';
  final AuthProvider? model;
  const RegisterView({super.key, this.model});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController countryIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //final formKey = GlobalKey<FormState>();
  var isLoading = false;
  late AuthProvider _model;
  final String? _country = null;

  @override
  void initState() {
    //final auth = Provider.of<AuthProvider>(context, listen: false);
    // TextEditingController firstNameController =
    //     TextEditingController(text: auth.firstName);
    // TextEditingController lastNameController =
    //     TextEditingController(text: auth.lastName);
    // TextEditingController emailController =
    //     TextEditingController(text: auth.email);
    // TextEditingController phoneNumberController =
    //     TextEditingController(text: auth.phone);
    // TextEditingController countryIdController =
    //     TextEditingController(text: auth.country);
    // TextEditingController passwordController =
    //     TextEditingController(text: auth.password);
    // TextEditingController confirmPasswordController =
    //     TextEditingController(text: auth.confirmPassword);

    getAllCountries();
    super.initState();
    //   _model = widget.model ?? AuthProvider();
    //   _model.getAllCountries();
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

  var countries = <Countries>[];
  final countriesName = <String>[];
  Future<void> getAllCountries() async {
    try {
      var url = 'https://logikeep.trashit.com.ng/api/v1/allcountry';
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        final data = json.encode(jsonData['data']);
        print(data);
        setState(() {
          isLoading = true;
          countries.assignAll(countriesFromJson(data));
        });

        getCountriesName();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getCountriesName() {
    countriesName.addAll(countries.map((element) => element.name).toList());
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: auth.isLoaded
            ? Padding(
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
                        InputWidget(
                            controller: firstNameController,
                            hintText: "First Name",
                            keyBoardType: TextInputType.name,
                            validator: (value) => value == null ||
                                    value.length < 3
                                ? 'First Name should be at least 3 characters'
                                : null),
                        Gap(30.h),
                        InputWidget(
                            controller: lastNameController,
                            hintText: "Last Name",
                            keyBoardType: TextInputType.name,
                            validator: (value) => value == null ||
                                    value.length < 3
                                ? 'Last Name should be at least 3 characters'
                                : null),
                        Gap(30.h),
                        InputWidget(
                          controller: emailController,
                          hintText: "Email Address",
                          keyBoardType: TextInputType.emailAddress,
                          validator: (value) =>
                              value == null || !GetUtils.isEmail(value)
                                  ? 'Enter a valid email address'
                                  : null,
                        ),
                        Gap(30.h),
                        InputWidget(
                          controller: phoneNumberController,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(11)
                          ],
                          hintText: "Phone Number",
                          keyBoardType: TextInputType.phone,
                          validator: (value) =>
                              value == null || value.length != 11
                                  ? 'Enter a valid phone number'
                                  : null,
                        ),
                        Gap(30.h),
                        DropDownMenuWidget(
                            value: auth.country,
                            hint: 'Select Country',
                            isDense: true,
                            itemList: auth.countriesName,
                            onChanged: (value) {
                              setState(() {
                                auth.country = value;
                              });
                            },
                            controller: countryIdController),
                        Gap(30.h),
                        InputWidget(
                          controller: passwordController,
                          hintText: "Password",
                          obscureText: auth.passwordVisibility,
                          suffixIcon: GestureDetector(
                            onTap: () => auth.passwordVisibility =
                                !auth.passwordVisibility,
                            child: Icon(
                              auth.passwordVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              size: 24.sp,
                              color: kPrimaryText.withOpacity(0.5),
                            ),
                          ),
                          validator: (value) =>
                              (value == null || value.length < 6)
                                  ? 'Password should be at least 6 characters'
                                  : null,
                        ),
                        Gap(30.h),
                        InputWidget(
                          controller: confirmPasswordController,
                          hintText: "Confirm Password",
                          obscureText: auth.confirmPasswordVisibility,
                          suffixIcon: GestureDetector(
                            onTap: () => auth.confirmPasswordVisibility =
                                !auth.confirmPasswordVisibility,
                            child: Icon(
                              auth.confirmPasswordVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              size: 24.sp,
                              color: kPrimaryText.withOpacity(0.5),
                            ),
                          ),
                          validator: (value) =>
                              (value == null || value.length < 6)
                                  ? 'Password should be at least 6 characters'
                                  : null,
                        ),
                        Gap(30.h),
                        InputWidget(
                          hintText: "Referral code",
                          keyBoardType: TextInputType.phone,
                        ),
                        Gap(40.h),
                        SizedBox(
                          width: 250.w,
                          child: PrimaryButton(
                            onPressed: () async {
                              final authProvider = Provider.of<AuthProvider>(
                                  context,
                                  listen: false);
                              await authProvider.register(
                                  firstNameController.text,
                                  lastNameController.text,
                                  emailController.text,
                                  phoneNumberController.text,
                                  countryIdController.text,
                                  passwordController.text,
                                  confirmPasswordController.text);
                              // await authProvider.register(
                              //   firstName: firstNameController.text,
                              //   lastName: lastNameController.text,
                              //   email: emailController.text,
                              //   phone: phoneNumberController.text,
                              //   id: countryIdController.text,
                              //   password: passwordController.text,
                              //   confirmPassword: confirmPasswordController.text );
                            },
                            enabled: auth.enabled,
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 500),
                              child: auth.isProcessing
                                  ? Center(
                                      child: SizedBox(
                                        height: 26.r,
                                        width: 26.r,
                                        child: const CircularProgressIndicator(
                                          color: kPrimaryWhite,
                                        ),
                                      ),
                                    )
                                  : MyText(
                                      "Sign Up",
                                      fontStyle: FontStyle.mulish,
                                      textAlign: TextAlign.center,
                                      color: kPrimaryWhite,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.sp,
                                      letterSpacing: 1.sp,
                                    ),
                            ),
                          ),
                        ),
                        Gap(20.h),
                        GestureDetector(
                          onTap: () {},
                          child: RichText(
                            text: TextSpan(
                              text: 'Already have an account? ',
                              style: kStyleLato.copyWith(
                                color: kPrimaryText,
                                fontSize: 14.sp,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Login',
                                  style: kStyleLato.copyWith(
                                      fontSize: 13.sp, color: kPrimaryBlue),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
            : Center(
                child: SizedBox(
                  height: 30.r,
                  width: 30.r,
                  child: const CircularProgressIndicator(
                    color: kPrimaryBlue,
                  ),
                ),
              ));
  }
}
