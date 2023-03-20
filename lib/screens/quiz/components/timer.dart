import 'package:flutter/material.dart';
import 'package:flutter_quizzapp/controllers/question_controller.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class Timer extends StatelessWidget {
  const Timer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    backgroundColor: Color(0xffffc7d0),
                    color: Color(0xffff8fa2),
                    value: 1 * controller.animation.value,
                    strokeWidth: 10,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
