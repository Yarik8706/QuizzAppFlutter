import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quizzapp/constrans.dart';
import 'package:flutter_quizzapp/screens/sait_screen/sait_screen.dart';
import 'package:flutter_quizzapp/screens/welcome_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb){
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constants.apiKey,
            appId: Constants.appId,
            messagingSenderId: Constants.messagingSenderId,
            projectId: Constants.projectId));
  }

  else{
    await Firebase.initializeApp();
  }

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
            fontFamily: "Outfit",
            color: Color(0xffb1b2ff),
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle().copyWith(
            fontFamily: "Comfortaa",
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          labelSmall: TextStyle().copyWith(
              fontFamily: "Comfortaa", color: Colors.black, fontSize: 20),
          bodyMedium: TextStyle().copyWith(
              fontFamily: "Comfortaa", color: Colors.white, fontSize: 20),
          bodyLarge: TextStyle().copyWith(
            fontFamily: "Comfortaa",
            color: Colors.white,
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle().copyWith(
              fontFamily: "Comfortaa", color: Colors.black, fontSize: 18),
          titleMedium: TextStyle().copyWith(
              fontFamily: "Comfortaa", color: Colors.grey, fontSize: 16),
          labelMedium: TextStyle().copyWith(
              fontFamily: "Comfortaa", color: Colors.black, fontSize: 20),
          displaySmall: TextStyle().copyWith(color: Colors.grey, fontSize: 16),
          displayMedium: TextStyle(
              fontFamily: "Outfit",
              fontSize: 23,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
          headlineMedium: TextStyle(
              fontFamily: "Outfit",
              height: 1.2,
              letterSpacing: 1.2,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainSaitScreen(),
        '/quiz1': (context) => const WelcomeScreen()
      },
    );
  }
}
