import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_quizzapp/models/Questions.dart';
import 'package:flutter_quizzapp/models/User.dart';
import 'package:flutter_quizzapp/screens/score_screen.dart';
import 'package:get/get.dart';

enum AnswerType { True, Skip, False }
// We use get package for our state management

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  // Lets animated our progress bar

  AnimationController _timerAnimationController;
  Animation _animation;
  // so that we can access our animation outside
  Animation get animation => this._animation;

  PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = sample_data
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();
  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _correctAns = 0;
  int get correctAns => this._correctAns;

  String user_name = "";

  List<AnswerType> _answersType = [];
  List<AnswerType> get answersType => this._answersType;

  int _selectedAns;
  int get selectedAns => this._selectedAns;

  // for more about obs please check documentation
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    // Our animation duration is 60 s
    // so our plan is to fill the progress bar within 60s
    _timerAnimationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation =
        Tween<double>(begin: 0, end: 1).animate(_timerAnimationController)
          ..addListener(() {
            // update like setState
            update();
          });

    // start our animation
    // Once 60s is completed go to the next qn
    _timerAnimationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
    _timerAnimationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) {
      _numOfCorrectAns++;
      _answersType.add(AnswerType.True);
    } else {
      _answersType.add(AnswerType.False);
    }

    // It will stop the counter
    _timerAnimationController.stop();
    update();

    // Once user select an ans after 3s it will go to the next qn
    // Future.delayed(Duration(seconds: 1), () {
    //   nextQuestion();
    // });
  }

  void nextQuestion() {
    if (selectedAns == -1) _answersType.add(AnswerType.Skip);
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _selectedAns = -1;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      // Reset the counter
      _timerAnimationController.reset();

      // Then start it again
      // Once timer is finish go to the next qn
      _timerAnimationController.forward().whenComplete(nextQuestion);
    } else {
      // Get package provide us simple way to naviigate another page
      Get.to(ScoreScreen());
    }
  }

  Future addUserData() async {
    final docUser = FirebaseFirestore.instance.collection("users").doc();
    final user = User(docUser.id, user_name,
        (correctAns / (questions.length + 1) * 100).toInt());

    await docUser.set(user.toJson());
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
