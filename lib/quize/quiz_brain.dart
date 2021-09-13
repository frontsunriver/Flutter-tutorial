import 'question.dart';

// ignore: camel_case_types
class Quize_brain {
  int questionNumber = 0;
  List<Question> list = [
    Question("Some cats are actually allergic to humans", true),
    Question("You can lead a cow down stairs but not up stairs.", true),
    Question(
        "Approximately one quarter of human bones are in the feet.", false),
    Question("A slug\'s blood is green.", true),
    Question("Buzz Aldrin\'s mother\'s maiden name was \"Moon\".", true),
    Question(
        "No piece of square dry paper can be folded in half more than 7 times.",
        true),
    Question(
        "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.",
        false),
    Question(
        "Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.",
        false),
  ];

  void nextQuestion() {
    if (questionNumber < list.length - 1) {
      questionNumber++;
    }
  }

  String getQuestionText() {
    return list[questionNumber].questionText;
  }

  bool getAnswer() {
    return list[questionNumber].questionAnswer;
  }

  int currentQuestionNumber() {
    return questionNumber;
  }
}
