import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quizzapp/constants.dart';
import 'package:flutter_quizzapp/controllers/question_controller.dart';
import 'package:flutter_quizzapp/screens/leader_board_screen.dart';
import 'package:flutter_quizzapp/screens/welcome_screen.dart';
import 'package:get/get.dart';

class ScoreScreen extends StatelessWidget {

  int currentState = 0;

  FlSpot addSpot(int index, List<AnswerType> answers) {
    if ((answers[index] == AnswerType.False ||
        answers[index] == AnswerType.Skip) && currentState > 0) {
      currentState--;
    } else if (currentState < 3) {
      currentState++;
    }
    return FlSpot(index.toDouble(), currentState.toDouble());
  }

  int countTypeAnswerOccurrences(List<AnswerType> list, AnswerType type) {
    int count = 0;
    for (int i = 0; i < list.length; i++) {
      if (list[i] == type) {
        count++;
      }
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text("Good Job!", style: Theme
                .of(context)
                .textTheme
                .titleLarge
                .copyWith(color: Colors.black))),
            SizedBox(height: 5,),
            Container(
              width: double.infinity,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xffff8fa2)
              ),
              child: Column(
                children: [
                  Container(
                    child: Image.asset("assets/cup.png", fit: BoxFit.cover),
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                  ),
                  Text("You get +${(_qnController.correctAns /
                      (_qnController.questions.length + 1) * 100)
                      .toInt()} Quiz Points")
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text("ACCURATION ANSWER", style: Theme
                .of(context)
                .textTheme
                .titleMedium,),
            Container(
              margin: EdgeInsets.only(top: 0, bottom: 10),
              height: 100,
              width: double.infinity,
              child: LineChart(
                  LineChartData(
                      borderData: FlBorderData(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: Colors.grey
                              )
                          )
                      ),
                      gridData: FlGridData(
                        show: false,
                      ),
                      titlesData: FlTitlesData(
                          leftTitles: AxisTitles(sideTitles: SideTitles(
                              showTitles: false
                          )),
                          bottomTitles: AxisTitles(sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, _) {
                                return Text((value.toInt() + 1).toString(), style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodySmall,);
                              }
                          ))
                      ),
                      minX: 0,
                      maxY: 3,
                      minY: 0,
                      maxX: (_qnController.answersType.length - 1).toDouble(),
                      lineBarsData: [
                        LineChartBarData(
                            isCurved: true,
                            dotData: FlDotData(show: false),
                            shadow: Shadow(
                                color: Color(0xff6d5de0),
                                offset: Offset(0, 6),
                                blurRadius: 10
                            ),
                            color: Color(0xff6d5de0),
                            barWidth: 3,
                            spots: [
                              ...List.generate(
                                  _qnController.answersType.length,
                                      (index) =>
                                      addSpot(index, _qnController.answersType)
                              )
                            ]
                        )
                      ]
                  )
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("CORRECT ANCWER", style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium,),
                      SizedBox(height: 10,),
                      Text(_qnController.correctAns.toString() + " question", style: Theme
                          .of(context)
                          .textTheme
                          .labelMedium,),
                    ]
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("COMPLETENTION", style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium,),
                      SizedBox(height: 10,),
                      Text("${(_qnController.correctAns / (_qnController.questions.length + 1) * 100).toInt()}%", style: Theme
                          .of(context)
                          .textTheme
                          .labelMedium,),
                    ]
                )
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("SKIPPED", style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium,),
                      SizedBox(height: 10,),
                      Text(countTypeAnswerOccurrences(_qnController.answersType, AnswerType.Skip).toString(), style: Theme
                          .of(context)
                          .textTheme
                          .labelMedium,),
                    ]
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("COMPLETENTION", style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium,),
                      SizedBox(height: 10,),
                      Text(countTypeAnswerOccurrences(_qnController.answersType, AnswerType.False).toString(), style: Theme
                          .of(context)
                          .textTheme
                          .labelMedium,),
                    ]
                )
              ],
            ),
            SizedBox(height: 10,),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  _qnController.addUserData();
                  Get.to(LeaderBoardScreen());
                  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff6a5ae0),
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(19.0)),
                  ),
                ),
                child: Text("Done", style: Theme.of(context).textTheme.bodyMedium,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
