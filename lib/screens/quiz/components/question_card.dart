import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quizzapp/constants.dart';
import 'package:flutter_quizzapp/controllers/question_controller.dart';
import 'package:flutter_quizzapp/models/Questions.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';

import 'option.dart';
import 'timer.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key key,
    // it means we have to pass this
    @required this.question,
    @required this.questionNumber,
  }) : super(key: key);

  final String questionNumber;
  final Question question;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Timer()),
          Text(
            questionNumber,
            textAlign: TextAlign.left,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                .copyWith(color: kBlackColor),
          ),
          Container(
            height: 70,
            child: Text(
              question.question,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  .copyWith(color: kBlackColor),
            ),
          ),
          SizedBox(height: kDefaultPadding / 2),
          Container(
            height: 330,
            child: Column(
              children: [
                ...List.generate(
                  question.options.length,
                  (index) => Option(
                    index: index,
                    text: question.options[index],
                    press: () => _controller.checkAns(question, index),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: _controller.nextQuestion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffcdf0ea),
                      padding:
                          EdgeInsets.symmetric(horizontal: 0.08 * screenSize.width, vertical: 10),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(19.0)),
                      ),
                    ),
                    child: Text("Skip",
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            .copyWith(color: kBlackColor))),
                SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                    onPressed: _controller.nextQuestion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffb1b2ff),
                      padding:
                          EdgeInsets.symmetric(horizontal: 0.1 * screenSize.width, vertical: 10),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(19.0)),
                      ),
                    ),
                    child: Text("Next",
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            .copyWith(color: Colors.white))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
