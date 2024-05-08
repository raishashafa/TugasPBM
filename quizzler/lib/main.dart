import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// membuat object quizBrain
QuizBrain quizBrain = QuizBrain();

// main Method
void main() {
  runApp(const QuizzlerApp());
}

class QuizzlerApp extends StatelessWidget {
  const QuizzlerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.quiz, color: Colors.pink), 
              SizedBox(width: 10), // Jarak antara ikon dan teks
              Text(
                'Quizzler',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 252, 234, 234),
          centerTitle: true,
          leading: Icon(
            Icons.lightbulb_outline, color: Colors.pink, size: 40), // Menggunakan ikon lightbulb_outline sebagai ganti logo
        ),
        backgroundColor: const Color.fromARGB(255, 252, 234, 234), // Perbaiki warna background agar sesuai dengan AppBar
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // array/list untuk menyimpan score, berupa Icon check or close.
  List<Icon> scoreKeeper = [];

  // menghitung jawaban benar dan salah
  int numCorrect = 1; 
  int numIncorrect = 0;

  
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    // setState
    setState(() {
      //TODO: Step 4 - menggunakan IF/ELSE untuk cek akhir quiz
      //jika ia, maka ke line berikutnya
      if (quizBrain.isFinished()) {
        //TODO Step 4 Part A - menampilkan alert menggunakan rFlutter_alert
        Alert(
          context: context,
          style: AlertStyle(
            backgroundColor: const Color.fromARGB(255, 252, 234, 234),
          ),
          title: 'Finished',
          desc: 'You\'ve reached the end of the Quiz\n'
              'Correct Answers: $numCorrect\n'
              'Incorrect Answers: $numIncorrect\n'
              'Total Questions: ${quizBrain.getTotalQuestions()}',
        ).show();

        quizBrain.reset();

        scoreKeeper = [];
      }

      //TODO: Step 6 - if not reached the end, ELSE do the answer checking
      else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check_circle_outline, // Ubah icon untuk jawaban benar
            color: Colors.green,
          ));
          numCorrect++;
        } else {
          scoreKeeper.add(Icon(
            Icons.cancel_outlined, // Ubah icon untuk jawaban salah
            color: Colors.red,
          ));
          numIncorrect++;
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.black, // Perbaiki warna teks agar terlihat jelas
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 100, 247, 105)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(fontSize: 20.0),
                ),
              ),
              child: const Text(
                "TRUE",
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(false);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 250, 18, 1)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(fontSize: 20.0),
                ),
              ),
              child: const Text(
                "FALSE",
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
