import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(questionText: 'Lagu Epiphany berasal dari Album Folklore', questionAnswer: true),
    Question(questionText: 'Album Speak Now dirilis tahun 2020', questionAnswer: false),
    Question(questionText: 'Taylor Swift pernah konser di Indonesia', questionAnswer: false),
    Question(questionText: '"Can I go where you go?" merupakan potongan lirik dari lagu Lover', questionAnswer: true),
    Question(questionText: 'Taylor Swift adalah seorang Sagitarius', questionAnswer: true),
    Question(questionText: 'Ayah Taylor Swift adalah orang Bekasi', questionAnswer: false),
    Question(questionText: 'Taylor Swift mendapatkan 14 Grammy Awards', questionAnswer: true),
    Question(questionText: 'Harry Styles dan Taylor Swift adalah saudara', questionAnswer: false),
    Question(questionText: 'Taylor Swift suka makan Bakso', questionAnswer: false),
    Question(questionText: 'Selena Gomez dan Taylor Swift merupakan teman dekat', questionAnswer: true),
    Question(questionText: 'Taylor Swift memiliki 2 orang anak', questionAnswer:  false),
    Question(questionText: 'Kanye West dan Taylor Swift tidak akur', questionAnswer: true),
    Question(questionText: 'Taylor Swift termasuk Generasi Milenial', questionAnswer: true),
    Question(questionText: 'Taylor Swift akan berkolaborasi dengan Haechan NCT', questionAnswer: false),
    Question(questionText: 'Taylor Swift lahir bulan Desember', questionAnswer: true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  //TODO: Step 3 Part A - create isFinished method that checks the last questions.
  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1 ) {
      print('returning true');
      return true;
    } else {
      return false;
    }
  }

  //TODO: Menghitung jumlah pertanyaan
  int getTotalQuestions() {
    return _questionBank.length;
  }
  //TODO: Step 4 Part B - Create a reset() method that sets the questionNumber back to 0
  void reset() {
    _questionNumber = 0;
  }
}