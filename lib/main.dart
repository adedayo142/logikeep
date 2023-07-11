import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logi_keep/providers/auth_provider.dart';
import 'package:logi_keep/routes/routes.dart';
import 'package:logi_keep/screens/splash_screen.dart';
import 'package:logi_keep/utils/my_scroll_behaviour.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) => MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (context) => AuthProvider())
                ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'LogiKeep',
                theme: ThemeData(
                  textTheme:
                      GoogleFonts.interTextTheme(Theme.of(context).textTheme)
                          .apply(fontSizeFactor: 1.sp),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                builder: (context, widget) {
                  SystemChrome.setPreferredOrientations(
                      [DeviceOrientation.portraitUp]);
                  widget = ScrollConfiguration(
                    behavior: const MyScrollBehavior(),
                    child: widget!,
                  );
                  return widget;
                },
                initialRoute: SplashScreen.route,
                onGenerateRoute: onGenerateRoutes,
              ),
            ));
  }
}
