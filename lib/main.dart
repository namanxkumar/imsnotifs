import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homepage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xff181818),
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GameApp',
      theme: ThemeData(
        colorScheme: ColorScheme(
          background: Color(0xff121212), //darkest [in use]
          surface: Color(0xff181818), //card(lighter) [in use]
          primary: Color(0xffE85C5C), //redbright [in use]
          primaryVariant:
              Color.fromRGBO(232, 92, 92, 0.1), //red translucent [in use]
          secondary: Color(0xffE9CE2C), //green [in use]
          secondaryVariant:
              Color.fromRGBO(77, 197, 145, 0.1), //green translucent [in use]
          brightness: Brightness.dark,
          error: Color(0xff650404), //dark red
          onBackground: Color(0xffFFFFFF), //heading text [in use]
          onError: Color(0xffFFFFFF), //tbd
          onPrimary: Color(0xff4B1F12), //DARK RED [in use]
          onSecondary: Color(0xffFFFFFF), //tbd
          onSurface: Color(0xffB3B3B3), //secondary text [in use]
        ),
        textTheme: TextTheme(
          button: GoogleFonts.poppins(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary, //redbright
          ),
          headline1: GoogleFonts.poppins(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}
