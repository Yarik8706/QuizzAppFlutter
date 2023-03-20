import 'package:flutter/material.dart';
import 'package:flutter_quizzapp/constants.dart';
import 'package:flutter_quizzapp/controllers/question_controller.dart';
import 'package:flutter_quizzapp/screens/quiz/quiz_screen.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xffefeefc) //#efeefc
            ),
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(), //2/6
                    Text(
                      "Quizz.me",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Spacer(flex: 2), // 1/6
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          _controller.user_name = value;
                        },
                        controller: nameController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffb1b2ff), width: 2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Enter the name",
                          hintStyle: TextStyle(color: Colors.grey[600]),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 35, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(flex: 3), // 1/6
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate())
                          Get.to(QuizScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffcdf0ea),
                        elevation: 0,
                        fixedSize: Size(200, 50),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(19.0)),
                        ),
                      ),
                      child: Text(
                        "Start Quiz",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Outfit",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(flex: 2), // it will take 2/6 spaces
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
