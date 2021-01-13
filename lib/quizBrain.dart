import 'questions.dart';

class QuizBrain{
  int questionNum = 0;

  List <Question> questionAnswer = [
    Question(q: 'There are 9 Supreme Court Justices', a: true),
    Question(q: 'Hawaii has a higher population than Alaska', a: true),
    Question(q: 'Kentucky touches Ohio', a: true),
    Question(q: 'There are 435 members of congress', a: false),
    Question(q: 'There have been 27 amendments to the US Constitution', a: true),
    Question(q: 'Columbus Day is not celebrated in Wyoming', a: false),
    Question(q: 'Idaho touches Colorado', a: false),
    Question(q: '35 states end in a vowel (Including "Y")', a: false),
    Question(q: 'The US congress has declared war 11 times', a: true),
    Question(q: 'There has only been 1 atheist president', a: false),
  ];


  nextQuestion(){
    if(questionNum < questionAnswer.length - 1){
      questionNum++;
    }
  }

  String getText(){
     return questionAnswer[questionNum].questionText;
  }

  bool getAnswer(){
    return questionAnswer[questionNum].questionAnswer;
  }

  reset(){
    questionNum = 0;
  }

  bool isFinished(){
    if(questionNum >= questionAnswer.length - 1)
      return true;
    else
      return false;
  }








}