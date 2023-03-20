import 'package:flutter/material.dart';

class MainSaitScreen extends StatelessWidget {
  const MainSaitScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000235),
      body: Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            Text("Quizz.me", style: Theme.of(context).textTheme.bodyLarge,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(100))
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text("dgfsbgdgb", style: Theme.of(context).textTheme.bodyLarge,),
                    ],
                  )
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}
