import 'package:doctor_ui/constants.dart';
import 'package:flutter/material.dart';

import 'screens/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthcare - Doctor Consultation App',
      theme: ThemeData(
          primaryColor: primaryColor,
          textTheme: Theme.of(context).textTheme.apply(displayColor: textColor),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.all(defaultPadding))),
          primarySwatch: Colors.blue,
          inputDecorationTheme: InputDecorationTheme(
              border: oinput, enabledBorder: ttborder, focusedBorder: oinput)),
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
