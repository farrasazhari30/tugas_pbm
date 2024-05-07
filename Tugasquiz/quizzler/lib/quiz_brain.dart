import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(
        questionText: 'Aries adalah zodiak pertama dalam urutan zodiak.',
        questionAnswer: true),
    Question(
        questionText: 'Taurus dikenal sebagai zodiak yang paling sabar.',
        questionAnswer: false),
    Question(
        questionText: 'Gemini adalah zodiak yang paling cerdas.',
        questionAnswer: false),
    Question(
        questionText: 'Cancer adalah zodiak yang paling emosional.',
        questionAnswer: false),
    Question(
        questionText: 'Leo adalah zodiak yang paling percaya diri.',
        questionAnswer: true),
    Question(
        questionText: 'Virgo adalah zodiak yang paling perfeksionis.',
        questionAnswer: true),
    Question(
        questionText: 'Libra adalah zodiak yang paling diplomatis.',
        questionAnswer: true),
    Question(
        questionText: 'Scorpio adalah zodiak yang paling misterius.',
        questionAnswer: true),
    Question(
        questionText: 'Sagitarius adalah zodiak yang paling petualang.',
        questionAnswer: true),
    Question(
        questionText: 'Capricorn adalah zodiak yang paling ambisius.',
        questionAnswer: true),
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
    if (_questionNumber >= _questionBank.length - 1) {
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
