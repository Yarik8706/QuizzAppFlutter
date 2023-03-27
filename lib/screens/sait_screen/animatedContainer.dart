import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedIntroContainer extends StatefulWidget {
  const AnimatedIntroContainer({Key key}) : super(key: key);

  @override
  State<AnimatedIntroContainer> createState() => _AnimatedIntroContainerState();
}

class _AnimatedIntroContainerState extends State<AnimatedIntroContainer> {
  bool isStartText = true;
  bool isSecondText = true;
  bool isThirdText = true;
  bool isFourText = true;
  bool mayShow = false;

  void changeStartText(int index) {
    if (index != 1) return;
    setState(() {
      isStartText = false;
    });
  }

  void changeSecondText(int index) {
    if (index != 1) return;
    setState(() {
      isSecondText = false;
    });
  }

  void changeThirdText(int index) {
    if (index != 1) return;
    setState(() {
      isThirdText = false;
    });
  }

  void changeFourText(int index) {
    if (index != 1) return;
    setState(() {
      isFourText = false;
    });
  }

  void changeMayShow(int index) {
    if (index != 1) return;
    setState(() {
      mayShow = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = Theme.of(context).textTheme.headlineMedium;
    TextStyle buttonStyle = TextStyle(
      letterSpacing: 1.2,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontSize: 12,
      fontFamily: "Outfit",
    );
    return Container(
      width: 360,
      height: 190,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(100),
            bottomLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
          ),
          gradient: mayShow
              ? LinearGradient(
                  colors: [Color(0xff3b1e93), Color(0xffea94fd)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: !mayShow ? Color(0xffffff) : null),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isStartText
                      ? AnimatedTextKit(
                          totalRepeatCount: 2,
                          onNextBeforePause: (_, _d) => changeStartText(_),
                          animatedTexts: [
                              RotateAnimatedText("",
                                  transitionHeight:
                                      titleStyle.fontSize * titleStyle.height),
                              RotateAnimatedText("Новый",
                                  textStyle: titleStyle,
                                  transitionHeight:
                                      titleStyle.fontSize * titleStyle.height,
                                  alignment: Alignment.centerLeft),
                            ])
                      : Text("Новый", style: titleStyle),
                  isSecondText
                      ? AnimatedTextKit(
                          totalRepeatCount: 2,
                          pause: Duration(milliseconds: 1500),
                          onNextBeforePause: (_, _d) => changeSecondText(_),
                          animatedTexts: [
                              RotateAnimatedText("",
                                  transitionHeight:
                                      titleStyle.fontSize * titleStyle.height),
                              RotateAnimatedText("Подход К",
                                  textStyle: titleStyle,
                                  transitionHeight:
                                      titleStyle.fontSize * titleStyle.height,
                                  alignment: Alignment.centerLeft),
                            ])
                      : Text(
                          "Подход К",
                          style: titleStyle,
                        ),
                  isThirdText
                      ? AnimatedTextKit(
                          totalRepeatCount: 2,
                          pause: Duration(milliseconds: 2000),
                          onNextBeforePause: (_, _d) {
                            changeThirdText(_);
                            changeMayShow(_);
                          },
                          animatedTexts: [
                              RotateAnimatedText("",
                                  transitionHeight:
                                      titleStyle.fontSize * titleStyle.height),
                              RotateAnimatedText("Обучению",
                                  textStyle: titleStyle,
                                  transitionHeight:
                                      titleStyle.fontSize * titleStyle.height,
                                  alignment: Alignment.centerLeft)
                            ])
                      : Text(
                          "Обучению",
                          style: titleStyle,
                        ),
                  SizedBox(
                    height: 15,
                  ),
                  isFourText
                      ? AnimatedTextKit(
                          pause: Duration(milliseconds: 2000),
                          onNextBeforePause: (_, _d) {
                            changeFourText(_);
                          },
                          animatedTexts: [
                              RotateAnimatedText("", transitionHeight: 8),
                              RotateAnimatedText(
                                "Персонализированный учебный ресурс для школьников",
                                transitionHeight: 8,
                                alignment: Alignment.centerLeft,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    .copyWith(color: Colors.white, fontSize: 8),
                              ),
                            ])
                      : Text(
                          "Персонализированный учебный ресурс для школьников",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              .copyWith(color: Colors.white, fontSize: 8),
                        ),
                  SizedBox(
                    height: 15,
                  ),
                  mayShow
                      ? Row(
                          children: [
                            ElevatedButton(
                                onPressed: null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff4A24AB),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(19.0)),
                                  ),
                                ),
                                child: Text(
                                  "LEARN",
                                  style: buttonStyle,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            OutlinedButton(
                              onPressed: null,
                              style: OutlinedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(19.0)),
                                  ),
                                  side: BorderSide(
                                      width: 1, color: Color(0xffABD9D9))),
                              child: Text("QUIZ", style: buttonStyle),
                            )
                          ],
                        )
                      : Container()
                ],
              )),
          Flexible(
              flex: 1,
              child: mayShow
                  ? Transform.translate(
                      offset: Offset(10, 0),
                      child: Transform.scale(
                        scale: 1.4,
                        child: SizedBox(
                            height: 330,
                            child: Image.asset(
                              "site/purpleicons.png",
                              fit: BoxFit.fitHeight,
                            )),
                      ))
                  : Container())
          // ),
          // Flexible(
          //   flex: 1,
          //     child:
          //     Image.asset("assets/site/purpleicons.png")
          //)
        ],
      ),
    );
  }
}
