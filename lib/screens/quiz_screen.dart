import 'package:flutter/material.dart';
import '../models/subject_model.dart';

class QuizScreen extends StatefulWidget {
  final Subject subject;

  const QuizScreen({required this.subject});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  int currentQuestionIndex = 0;
  String feedbackMessage = '';

  late AnimationController _flipController;
  late Animation<double> _flipAnimation;
  bool isFlipped = false;

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _flipAnimation = Tween<double>(begin: 0, end: 1).animate(_flipController);
  }

  @override
  void dispose() {
    _flipController.dispose();
    super.dispose();
  }

  void checkAnswer(String correctAnswer) {
    setState(() {
      if (_controller.text.trim().toLowerCase() == correctAnswer.toLowerCase()) {
        feedbackMessage = "Correct!";
      } else {
        feedbackMessage = "Try again!";
      }
    });
  }

  void flipCard() {
    setState(() {
      isFlipped = !isFlipped;
      isFlipped ? _flipController.forward() : _flipController.reverse();
    });
  }

  void goToNextQuestion() {
    setState(() {
      if (currentQuestionIndex < widget.subject.questions.length - 1) {
        currentQuestionIndex++;
        _controller.clear();
        feedbackMessage = '';
        if (isFlipped) flipCard();
      }
    });
  }

  void goToPreviousQuestion() {
    setState(() {
      if (currentQuestionIndex > 0) {
        currentQuestionIndex--;
        _controller.clear();
        feedbackMessage = '';
        if (isFlipped) flipCard();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.subject.questions[currentQuestionIndex];
    final cardColors = _getCardColors(widget.subject.name); // Get unique colors for the subject

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.subject.name} Quiz"),
        backgroundColor: Colors.teal, // Match the color with HomePage header
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: flipCard,
              child: AnimatedBuilder(
                animation: _flipAnimation,
                builder: (context, child) {
                  final angle = _flipAnimation.value * 3.1416; // Pi radians for rotation
                  bool showFront = angle <= 3.1416 / 2;

                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(angle),
                    child: showFront
                        ? _buildFront(question.question, cardColors[0]) // Front color
                        : Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(3.1416), // Rotate back side
                      child: _buildBack(question.answer, cardColors[1]), // Back color
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Type your answer here",
              ),
            ),
            const SizedBox(height: 10),
            Text(
              feedbackMessage,
              style: const TextStyle(fontSize: 16, color: Colors.green),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_left, size: 36),
                  onPressed: goToPreviousQuestion,
                ),
                ElevatedButton(
                  onPressed: () => checkAnswer(question.answer),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.green, // Text color
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Add padding
                    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Text style
                  ),
                  child: const Text("Submit"),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_right, size: 36),
                  onPressed: goToNextQuestion,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Color> _getCardColors(String subjectName) {
    switch (subjectName.toLowerCase()) {
      case 'math':
        return [Colors.amber, Colors.amberAccent];
      case 'science':
        return [Colors.lightGreen, Colors.lightGreenAccent];
      case 'history':
        return [Colors.orange, Colors.deepOrangeAccent];
      case 'literature':
        return [Colors.pink, Colors.pinkAccent];
      case 'geography':
        return [Colors.blueAccent, Colors.lightBlueAccent];
      default:
        return [Colors.grey, Colors.grey[400]!]; // Default color for other subjects
    }
  }

  Widget _buildFront(String question, Color color) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          question,
          style: const TextStyle(fontSize: 24, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildBack(String answer, Color color) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          answer,
          style: const TextStyle(fontSize: 24, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
