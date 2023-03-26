import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quizzapp/models/User.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({Key key}) : super(key: key);

  @override
  State<LeaderBoardScreen> createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {

  List users = [];

  @override
  void initState() {
    super.initState();
    initFirebase();
  }

  void initFirebase() async {
    await getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffb1b2ff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Center(
                child: Text("Leader Board", style: Theme.of(context).textTheme.bodyLarge,)
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, left: 10, right: 10),
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffefeefc),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Container(
                    height: 550,
                    child: ListView(
                        scrollDirection: Axis.vertical,
                      children: [
                        users.length == 0 ? Center(child: CircularProgressIndicator(),) : Container(),
                    ...List.generate(users.length, (index) => addUserWidget(context, users[index]["name"], users[index]["quizzCount"], index))
                      ]),
                  )
            ),
        ],
      ),
    );
  }

  void getUsers() async{
    await FirebaseFirestore.instance.collection("users").orderBy("quizzCount").get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((task) {
        setState(() {
          users.add(task.data());
        });
      });
    });
  }

  Container addUserWidget(BuildContext context, String name, int quizzCount, int index){
    String imagePath = '';

    switch(index){
      case 0:
        imagePath = "pictures/gold.png";
        break;
      case 1:
        imagePath = "pictures/silver.png";
        break;
      case 2:
        imagePath = "pictures/bronze.png";
        break;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Text("${index+1}.", style: Theme.of(context).textTheme.titleSmall,)),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Text("${name}", style: Theme.of(context).textTheme.titleSmall,)),
                ],
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Text("Quiz point: ${quizzCount}", style: Theme.of(context).textTheme.titleSmall,))
            ],
          ),
          imagePath != '' ? Container(
            height: 50,
            width: 50,
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ) : Container()
        ],
      ),
    );
  }
}
