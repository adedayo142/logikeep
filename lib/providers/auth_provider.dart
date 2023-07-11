import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:logi_keep/api/api.service.dart';
import 'package:logi_keep/helpers.dart';
// import 'package:logi_keep/models/auth_response.dart';
import 'package:logi_keep/models/countries.dart';
import 'package:logi_keep/models/register.dart';
import 'package:logi_keep/screens/auth/login.dart';
import 'package:logi_keep/utils/app_colors.dart';
import 'package:logi_keep/widgets/snackbar.dart';

class AuthProvider with ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String _firstName = '';
  late String _lastName = '';
  late String _email = '';
  late String _phone = '';
  late String _password = '';
  late String _confirmPassword = '';
  bool _passwordVisibility = true;
  bool _confirmPasswordVisibility = true;
  String? _country = null;
  bool _isProcessing = false;
  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;
  set isLoaded(bool value) => _isLoaded = value;

  String get firstName => _firstName;
  set firstName(String value) {
    _firstName;
  }
  //set firstName(String value) => _firstName = value;

  String get lastName => _lastName;
  set lastName(String value) {
    _lastName = value;
  }

  String get email => _email;
  set email(String value) {
    _email = value;
  }

  String get phone => _phone;
  set phone(String value) {
    _phone = value;
  }

  String get password => _password;
  set password(String value) {
    _password = value;
  }

  String get confirmPassword => _confirmPassword;
  set confirmPassword(String value) {
    _confirmPassword = value;
  }

  bool get confirmPasswordVisibility => _confirmPasswordVisibility;
  set confirmPasswordVisibility(bool value) =>
      _confirmPasswordVisibility = value;

  bool get passwordVisibility => _passwordVisibility;
  set passwordVisibility(bool value) => _passwordVisibility = value;

  String? get country => _country;
  set country(String? value) => _country = value;

  bool get isProcessing => _isProcessing;
  set isProcessing(bool value) => _isProcessing = value;

  bool get enabled =>
      firstName.isNotEmpty &&
      lastName.isNotEmpty &&
      email.isNotEmpty &&
      phone.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      country != null;

  AuthProvider() {
    getAllCountries();
  }

  Future<void> register(String firstName, String lastName, String email,
      String phone, String id, String password, String confirmPassword) async {
    var model = Data();
    model.firstname = firstName;
    model.lastname = lastName;
    model.email = email;
    model.phonenumber = phone;
    model.allCountryId = id;
    model.password = password;
    model.confirmPassword = confirmPassword;
    final response = await APIService().registerUser(model.toJson());
    if(response.data != null){
      print(response.data != null);
    }
  }

  // Future<void> register() async {
  //   FocusManager.instance.primaryFocus?.unfocus();
  //   if (!formKey.currentState!.validate()) return;
  //   bool hasInternet = await checkForInternet();
  //   if (!hasInternet) {
  // CustomSnackBar.showMaterial(
  //   context,
  //     title: 'Error!',
  //      content: 'No Internet Connection',
  //      backgroundColor: kPrimaryRed,
  //      textColor: kPrimaryWhite);

  // .showSnackBar(
  //     title: 'Error!',
  //     content: 'No Internet Connection',
  //     backgroundColor: kPrimaryRed,
  //     textColor: kPrimaryWhite);

  //   return;
  // }
  // final id = countries.firstWhere((element) => element.name == country).id;
  // Map<String, dynamic> body = {
  //   'firstname': firstName,
  //   'lastname': lastName,
  //   'email': email,
  //   'phonenumber': phone,
  //   'all_country_id': id.toString(),
  //   'password': password,
  //   'confirm_password': confirmPassword
  // };
  // try {
  //   isProcessing = true;
  //   final model = await APIService().registerUser(body);
  // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()));
  //Navigator.of(context).pushNamed(LoginView.route);
  //Get.toNamed(LoginView.route,);
  //} catch (e) {
  // debugPrint(e.toString());
  // CustomSnackBar.showGet(
  //   title: 'Error!',
  //   content: e.toString(),
  //   backgroundColor: kPrimaryRed,
  //   textColor: kPrimaryWhite,
  // );
  //   } finally {
  //     isProcessing = false;
  //   }
  // }

  final countries = <Countries>[];
  final countriesName = <String>[];
  Future<void> getAllCountries() async {
    try {
      var url = 'https://logikeep.trashit.com.ng/api/v1/allcountry';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        final data = json.encode(jsonData['data']);

        countries.assignAll(countriesFromJson(data));
        getCountriesName();
      }
      _isLoaded = true;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  void getCountriesName() {
    countriesName.addAll(countries.map((element) => element.name).toList());
    //notifyListeners();
  }
}
