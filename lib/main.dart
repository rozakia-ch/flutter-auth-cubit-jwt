import 'package:auth_app/constants/color_constants.dart';
import 'package:auth_app/ui/pages/welcome_page.dart';
import 'package:auth_app/ui/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Colors.white,
  //   statusBarBrightness: Brightness.dark,
  // ));
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: ColorConstant.primaryColor,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        // brightness: Brightness.light,
      ),
      initialRoute: "/",
      onGenerateRoute: AppRouter.generateRoute,
      home: WelcomePage(),
    );
  }
}
