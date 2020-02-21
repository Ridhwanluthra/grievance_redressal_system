import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grievance_redressal_system/landing_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xffe13236),
        statusBarIconBrightness: Brightness.light,
        // systemNavigationBarColor: Colors.orange[600],
        // systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        // LOGO colors
        // R => E13236
        // Y => FFF212
        // B => 199CD7
        primaryColor: Color(0xffe13236),
        canvasColor: Colors.white,
        accentColor: Color(0xff199cd7),
        buttonColor: Color(0xff199cd7),
        fontFamily: 'roboto',
        textTheme: TextTheme(
          button: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: LandingPage(),
    );
  }
}
