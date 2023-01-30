import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';



QuizBrain quizBrain=QuizBrain();

void main() {
  runApp(quizapp());
}

class quizapp extends StatelessWidget {
  const quizapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.grey.shade900,
        body:SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      )
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List <Widget> scoreKeeper=[];
  /*
  List <String> questions=[
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
  ];
  List <bool> answers=[false,true,true];

  Question q1=Question(q:'You can lead a cow down stairs but not up stairs.',a:false);
  Question q2=Question(q:'Approximately one quarter of human bones are in the feet.',a:true);
  Question q3=Question(q:'A slug\'s blood is green.',a:true);
  // q1.questionText   q1.questionAnswer
  List <Question> questions=[q1,q2,q3];

   */
/*
  List <Question> questionBank=[
  Question(q:'You can lead a cow down stairs but not up stairs.',a:false),
  Question(q:'Approximately one quarter of human bones are in the feet.',a:true),
  Question(q:'A slug\'s blood is green.',a:true),
  ];*/
  void dialogBox(){
    Alert(
      context: context,
      type: AlertType.success,
      title: "Finished!",
      desc: "You have reached the end of the quiz.",
      buttons: [
        DialogButton(
          child: Text(
            "OK!",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () { Navigator.pop(context);},
          width: 120,
        )
      ],
    ).show();
  }
  void checkAnswer (bool userPickedAnswer){
    bool correctAnswer=quizBrain.getQuestionAnswer();

    setState(() {

    if (userPickedAnswer==correctAnswer){
      print("User got it right!");

      scoreKeeper.add(Icon(Icons.check, color:Colors.green,),);

        if (quizBrain.checkEnd()==false) {
          quizBrain.nextQuestion();
        }
        else if (quizBrain.checkEnd()==true){
          dialogBox();
          quizBrain.resetFn();
          scoreKeeper.clear();
        }


    }else {
      print("User got it wrong!");
      scoreKeeper.add(Icon(Icons.close, color: Colors.red,),);

      if (quizBrain.checkEnd() == false) {
        quizBrain.nextQuestion();
      }

      else if (quizBrain.checkEnd()==true){
        dialogBox();
        quizBrain.resetFn();
        scoreKeeper.clear();

      }


    }
    });


  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding (
            padding:EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color:Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: (){

                checkAnswer(true);




              },
              child: Text(
                'True',
                style: TextStyle(
                  color:Colors.white,
                  fontSize:20.0,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ),
        ),
        Expanded(
          child:Padding(
            padding:EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: (){
                checkAnswer(false);

              },
              child:Text(
                'False',
                style: TextStyle(
                  fontSize:20.0,
                  color:Colors.white,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}





    /*
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'This is where the question text will go',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                  onPressed:(){
                    print('yes');

                  },
                  child: Text(
                      'True',
                          style:TextStyle(
                            fontSize: 50,
                      backgroundColor: Colors.green,
                  )
                  ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed:(){
                  print('no');

                },
                child: Text(
                    'False',
                    style: TextStyle(
                      fontSize: 50,
                      backgroundColor: Colors.red,
                    )
                ),
              ),

            ],
          ),

        ),
      ),
    );
  }
}
*/


