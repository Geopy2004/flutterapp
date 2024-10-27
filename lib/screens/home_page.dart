import 'package:flutter/material.dart';
import '../data/subjects_data.dart';
import 'quiz_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcard Subjects'),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.teal, // Changed header color
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white, // Changed to solid color for the background
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            final subject = subjects[index];
            Color cardColor = _getCardColor(subject.name); // Get unique color for each subject
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        QuizScreen(subject: subject),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  ),
                );
              },
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: cardColor, // Set card color
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      subject.name[0],
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(
                    subject.name,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, color: Colors.teal), // Changed icon color
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Function to return a unique color based on the subject name
  Color _getCardColor(String subjectName) {
    switch (subjectName.toLowerCase()) {
      case 'math':
        return Colors.amber;
      case 'science':
        return Colors.lightGreen;
      case 'history':
        return Colors.orange;
      case 'literature':
        return Colors.pink;
      case 'geography':
        return Colors.blueAccent;
      default:
        return Colors.grey; // Default color for other subjects
    }
  }
}
