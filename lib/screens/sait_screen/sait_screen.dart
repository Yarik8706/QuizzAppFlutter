import 'package:flutter/material.dart';
import 'package:flutter_quizzapp/screens/sait_screen/animatedContainer.dart';
import 'package:flutter_quizzapp/screens/sait_screen/hero_container.dart';
import 'package:flutter_quizzapp/screens/sait_screen/sait_question.dart';

class MainSaitScreen extends StatelessWidget {
  const MainSaitScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000235),
      body: ListView(children: [
        Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Quizz.me",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  .copyWith(fontWeight: FontWeight.bold, fontFamily: "Outfit"),
            ),
            SizedBox(
              height: 10,
            ),
            AnimatedIntroContainer(),
            SizedBox(
              height: 20,
            ),
            Text("Наши \nприемущества",
                style: Theme.of(context).textTheme.displayMedium),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: Offset(5, 20),
                  child: Transform.rotate(
                    angle: -170,
                    child: HeroContainer(
                      imagePath: "site/hero.png",
                      text: "Краткосрочная итерация",
                      firstColor: Color(0xff004BA3),
                      secondColor: Color(0xff5D2A8D),
                      thirdColor: Color(0xff0E0000),
                    ),
                  ),
                ),
                HeroContainer(
                  imagePath: "site/student.png",
                  text: "Персонализированное обучение",
                  firstColor: Color(0xfff50000),
                  secondColor: Color(0xff700000),
                  thirdColor: Color(0xff0E0000),
                ),
                Transform.translate(
                    offset: Offset(-5, 20),
                    child: Transform.rotate(
                        angle: 170,
                        child: HeroContainer(
                          imagePath: "site/wizzard.png",
                          text: "Вовлекающий контент",
                          firstColor: Color(0xff9045B9),
                          secondColor: Color(0xff47177B),
                          thirdColor: Color(0xff0E0000),
                        )))
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: SizedBox(
                        height: 120,
                        child: Image.asset(
                          "site/blueicon.png",
                          fit: BoxFit.fill,
                        )),
                  ),
                  Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Stay Focused",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                .copyWith(
                                    color: Color(0xffec95ff), fontSize: 30),
                          ),
                          Text(
                            "Наше приложение использует метод помидора, который помогает оставаться сфокусированным",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                .copyWith(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: SizedBox(
                        height: 100,
                        child: Image.asset(
                          "site/clock.png",
                          fit: BoxFit.fill,
                        )),
                  ),
                  Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "3 ANY",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                .copyWith(
                                  color: Color(0xffec95ff),
                                  fontSize: 30,
                                ),
                          ),
                          Text(
                            "Learn Anything, Anywhere, Anytime",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                .copyWith(
                                    fontFamily: "Comfortaa",
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 0.5,
                                    fontSize: 18),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 55, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Build with",
                    style: TextStyle(fontSize: 10, fontFamily: "Outfit"),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color(0xff2c1975),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 22,
                          child: Image.asset("site/flutter.png"),
                        ),
                        SizedBox(
                          height: 22,
                          child: Image.asset("site/firebase.png"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SaitQuestion(),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Первая версия",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Outfit"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 175,
                    height: 350,
                    child: Image.asset(
                      "site/iphone.png",
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            // Center(
            //   child: Container(
            //     width: 350,
            //     height: 200,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(25),
            //       gradient: LinearGradient(
            //         colors: [Color(0xff1f1065), Color(0xffa5d1d5)],
            //         begin: Alignment.topLeft,
            //         end: Alignment.bottomRight,
            //       ),
            //     ),
            //     child: Container(
            //       margin: EdgeInsets.only(bottom: 90, top: 30),
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text("Подписаться на новости",
            //               style: TextStyle(
            //                   fontSize: 12,
            //                   fontWeight: FontWeight.bold,
            //                   fontFamily: "Outfit",
            //                   color: Colors.black)),
            //           Container(
            //             height: 27,
            //             width: 100,
            //             padding: EdgeInsets.only(left: 10),
            //             alignment: Alignment.centerLeft,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10),
            //                 color: Color(0xff000235)),
            //             child: Text(
            //               "email",
            //               style: TextStyle(
            //                   fontSize: 10,
            //                   fontFamily: "Outfit",
            //                   color: Color(0xffb8b8ca)),
            //             ),
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // )
          ]),
        ),
      ]),
    );
  }
}
