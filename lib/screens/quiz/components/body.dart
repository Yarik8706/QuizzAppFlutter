import 'package:flutter/material.dart';
import 'package:flutter_quizzapp/constants.dart';
import 'package:flutter_quizzapp/controllers/question_controller.dart';
import 'package:get/get.dart';

import 'progress_bar.dart';
import 'question_card.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xffb1b2ff),
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 10),
                  child: ProgressBar(),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  // Block swipe to next qn
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQnNum,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                      question: _questionController.questions[index], questionNumber: "Question ${index+1}/${_questionController.questions.length}"),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
