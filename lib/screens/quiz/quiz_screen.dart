import 'package:flutter/material.dart';
import 'package:flutter_quizzapp/controllers/question_controller.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      body: Body(),
    );
  }
}
