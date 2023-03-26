import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroContainer extends StatelessWidget {

  final String imagePath;
  final String text;
  final Color firstColor;
  final Color secondColor;
  final Color thirdColor;

  const HeroContainer({Key key, this.imagePath, this.text, this.firstColor, this.secondColor, this.thirdColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 155,
      padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 30),
      decoration: BoxDecoration(
          color: Color(0xb2162f5f),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Color(0xff404168), width: 1)
      ),
      child: Column(
        children: [
          Container(
            width: 83,
            height: 57,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [firstColor, secondColor, thirdColor],
                stops: [0.01, 0.30, 0.99],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Transform.translate(
              offset: Offset(0, 0),
              child: Transform.scale(
                alignment: Alignment.bottomCenter,
                scaleX: 1.1,
                scaleY: 1.5,
                child: SizedBox(height: 83, child: Image.asset(imagePath, fit: BoxFit.fill)),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Outfit", fontWeight: FontWeight.bold, fontSize: 8),)
        ],
      ),
    );
  }
}
