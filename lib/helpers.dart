import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> checkForInternet() async {
  bool result = await InternetConnectionChecker().hasConnection;
  return result;
}
