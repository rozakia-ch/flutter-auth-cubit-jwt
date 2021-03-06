import 'package:auth_app/cubit/auth/auth_cubit.dart';
import 'package:auth_app/ui/pages/home_page.dart';
import 'package:auth_app/ui/pages/welcome_page.dart';
import 'package:auth_app/ui/router/app_router.dart';
import 'package:auth_app/ui/themes/styles.dart' as style;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Colors.white,
  //   statusBarBrightness: Brightness.dark,
  // ));
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        title: 'Flutter Auth',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: style.primaryColor,
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          // brightness: Brightness.light,
        ),
        // initialRoute: "/",
        onGenerateRoute: AppRouter.generateRoute,
        home: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthData) return HomePage();
            if (state is AuthFailed) return WelcomePage();
            return Scaffold(
              body: Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
