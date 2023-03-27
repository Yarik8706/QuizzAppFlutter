import 'package:flutter/material.dart';

class SaitQuestion extends StatefulWidget {
  const SaitQuestion({Key key}) : super(key: key);

  @override
  State<SaitQuestion> createState() => _SaitQuestionState();
}

class _SaitQuestionState extends State<SaitQuestion> {
  bool isShow = true;

  void _changeShowState() {
    setState(() {
      isShow = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !isShow
        ? Container()
        : Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Опрос",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Outfit"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Хотели бы вы использовать наше приложение для учебы?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Outfit"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 100,
                    height: 35,
                    child: ElevatedButton(
                        onPressed: _changeShowState,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff4a24ab),
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(13.0)),
                          ),
                        ),
                        child: Text("ДА",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Outfit"))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 100,
                    height: 35,
                    child: ElevatedButton(
                        onPressed: _changeShowState,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff4a24ab),
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(13.0)),
                          ),
                        ),
                        child: Text("НЕТ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Outfit"))),
                  )
                ],
              ),
            ),
          );
  }
}
