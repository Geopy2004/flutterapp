class Subject {
  final String name;
  final List<Question> questions;

  Subject({required this.name, required this.questions});
}

class Question {
  final String question;
  final String answer;

  Question({required this.question, required this.answer});
}
