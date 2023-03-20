import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quizzapp/screens/welcome_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          textTheme: TextTheme().copyWith(
            // caption: TextStyle().copyWith(fontFamily: "Outfit",),
            titleLarge: TextStyle().copyWith(
                fontFamily: "Outfit-Bold",
                color: Color(0xffb1b2ff),
                fontSize: 34
            ),
            titleSmall: TextStyle().copyWith(
                fontFamily: "Outfit-Bold",
                color: Colors.black,
                fontSize: 20
            ),
            labelSmall: TextStyle().copyWith(
                fontFamily: "Outfit-Bold",
                color: Colors.black,
                fontSize: 20
            ),
            bodyMedium: TextStyle().copyWith(
                fontFamily: "Outfit-Bold",
                color: Colors.white,
                fontSize: 20
            ),
            bodyLarge: TextStyle().copyWith(
                fontFamily: "Outfit-Bold",
                color: Colors.white,
                fontSize: 34
            ),
            bodySmall: TextStyle().copyWith(
                fontFamily: "Outfit-Bold",
                color: Colors.black,
                fontSize: 18
            ),
            titleMedium: TextStyle().copyWith(
                fontFamily: "Outfit-Bold",
                color: Colors.grey,
                fontSize: 16
            ),
            labelMedium: TextStyle().copyWith(
                fontFamily: "Outfit-Bold",
                color: Colors.black,
                fontSize: 20
            ),
            displaySmall: TextStyle().copyWith(
                color: Colors.grey,
                fontSize: 16
            ),
          )
      ),
      home: WelcomeScreen(),
    );
  }
}