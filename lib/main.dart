import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quiz_brain = QuizBrain();

void main() {
  runApp(new MaterialApp(home: TrueCitizenHome()));
}

class TrueCitizenHome extends StatefulWidget {
  @override
  _TrueCitizenHomeState createState() => _TrueCitizenHomeState();
}

class _TrueCitizenHomeState extends State<TrueCitizenHome> {

 int correctCounter = 0;
 int falseCounter = 0;


 checkAnswer(bool userAnswer) {
   setState(() {
     if (quiz_brain.isFinished() == true) {
       Alert(
         context: context,
         title: 'You\'ve reached the end of the quiz.',
         desc: 'TRUE: $correctCounter, FALSE: $falseCounter'
       ).show();
       quiz_brain.reset();
       correctCounter = 0;
       falseCounter = 0;
     } else {
       bool correctAnswer = quiz_brain.getAnswer();
       if(userAnswer == correctAnswer){
         correctCounter++;
         print('User got it right');
       }else{
         falseCounter++;
         print('User got it wrong');
       }
     }
   });

 }












  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFc28287),
      appBar: AppBar(
        backgroundColor: Color(0xFF885b5f),
        centerTitle: true,
        title: Text(
          'True Citizen',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            USAImage(),
            SizedBox(height: 90),
            QuestionContainer(),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xFFffd5d8),
                      ),
                      child: Text(
                        'True',
                        style: TextStyle(
                          color: Color(0xFF885b5f),
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    onTap: (){
                        setState(() {
                          checkAnswer(true);
                        });
                    },
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: (){
                      checkAnswer(false);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xFF885b5f),
                      ),
                      child: Text(
                        'False',
                        style: TextStyle(
                            color: Color(0xFFffd5d8),
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        quiz_brain.nextQuestion();
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xFFffd5d8),
                      ),
                      child: Icon(Icons.navigate_next, color: Color(0xFF885b5f)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container USAImage() {
    return Container(
        margin: EdgeInsets.only(top: 100.0),
        width: 150,
        height: 150,
        child: Image.asset('assets/united-states.png'));
  }

  QuestionContainer() {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        width: 400,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            border: Border.all(color: Color(0xFF885b5f), width: 2)),
        child: Text(
          quiz_brain.getText(),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      );
  }
}
