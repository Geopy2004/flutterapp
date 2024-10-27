import '../models/subject_model.dart';  // Ensure this import is correct

// Math Questions
List<Question> mathQuestions = [
  Question(question: "Solve: 5 + 3 x 2", answer: "11"),
  Question(question: "What is the value of π (Pi) up to 2 decimal places?", answer: "3.14"),
  Question(question: "What is 12 squared?", answer: "144"),
  Question(question: "How many degrees are there in a triangle?", answer: "180 degrees"),
  Question(question: "Solve: 15 ÷ 3 + 4", answer: "9"),
  Question(question: "What is the smallest prime number?", answer: "2"),
  Question(question: "What is the cube root of 27?", answer: "3"),
  Question(question: "What is 10% of 500?", answer: "50"),
  Question(question: "What is 7 + (6 x 5^2)?", answer: "157"),
  Question(question: "Find the area of a circle with radius 3.", answer: "28.27 square units"),
  Question(question: "What is the sum of the first 5 prime numbers?", answer: "28"),
  Question(question: "What is 0 factorial?", answer: "1"),
];

List<Question> scienceQuestions = [
  Question(question: "What planet is known as the Red Planet?", answer: "Mars"),
  Question(question: "What gas do plants absorb from the atmosphere?", answer: "Carbon Dioxide"),
  Question(question: "What is the speed of light?", answer: "299,792,458 m/s"),
  Question(question: "What is the powerhouse of the cell?", answer: "Mitochondria"),
  Question(question: "What is the boiling point of water?", answer: "100°C or 212°F"),
  Question(question: "What metal is liquid at room temperature?", answer: "Mercury"),
  Question(question: "Which element has the atomic number 1?", answer: "Hydrogen"),
  Question(question: "What is the chemical formula for water?", answer: "H2O"),
  Question(question: "What is the largest planet in the Solar System?", answer: "Jupiter"),
  Question(question: "What is the hardest natural substance on Earth?", answer: "Diamond"),
  Question(question: "What is the pH value of pure water?", answer: "7"),
];

List<Question> filipinoQuestions = [
  Question(question: "Sino ang pambansang bayani ng Pilipinas?", answer: "Jose Rizal"),
  Question(question: "Ano ang ibig sabihin ng 'Mabuhay'?", answer: "Live long or welcome"),
  Question(question: "Ano ang sagisag ng watawat na kulay pula?", answer: "Digmaan"),
  Question(question: "Sino ang sumulat ng El Filibusterismo?", answer: "Jose Rizal"),
  Question(question: "Ano ang pambansang bulaklak ng Pilipinas?", answer: "Sampaguita"),
  Question(question: "Ano ang pambansang laro ng Pilipinas?", answer: "Arnis"),
  Question(question: "Ilang rehiyon mayroon ang Pilipinas?", answer: "17"),
  Question(question: "Ano ang pambansang isda ng Pilipinas?", answer: "Bangus"),
  Question(question: "Ano ang Saligang Batas ng Pilipinas?", answer: "Constitution"),
  Question(question: "Ano ang kahulugan ng salitang 'Bayanihan'?", answer: "Community spirit"),
];

List<Question> historyQuestions = [
  Question(question: "Who was the first president of the Philippines?", answer: "Emilio Aguinaldo"),
  Question(question: "What year did the Philippines gain independence?", answer: "1946"),
  Question(question: "Who founded the Katipunan?", answer: "Andres Bonifacio"),
  Question(question: "When was the EDSA People Power Revolution?", answer: "1986"),
  Question(question: "When did Ferdinand Magellan arrive in the Philippines?", answer: "1521"),
  Question(question: "What treaty ended the Spanish-American War?", answer: "Treaty of Paris"),
  Question(question: "Who is known as the Father of the Philippine Revolution?", answer: "Andres Bonifacio"),
  Question(question: "What was the official religion during the Spanish colonization?", answer: "Roman Catholicism"),
  Question(question: "Who declared Martial Law in the Philippines?", answer: "Ferdinand Marcos"),
  Question(question: "What is the significance of the Cry of Pugad Lawin?", answer: "Start of the revolution"),
];

List<Question> musicQuestions = [
  Question(question: "How many strings does a standard guitar have?", answer: "6"),
  Question(question: "What is the national anthem of the Philippines?", answer: "Lupang Hinirang"),
  Question(question: "Who composed Fur Elise?", answer: "Ludwig van Beethoven"),
  Question(question: "How many beats are in a standard 4/4 time signature?", answer: "4 beats"),
  Question(question: "What family of instruments does the violin belong to?", answer: "String family"),
  Question(question: "Who composed the Brandenburg Concertos?", answer: "Johann Sebastian Bach"),
  Question(question: "What is the highest female singing voice?", answer: "Soprano"),
  Question(question: "What is a musical rest?", answer: "A period of silence"),
  Question(question: "What is the oldest known musical instrument?", answer: "Flute"),
  Question(question: "How many keys does a standard piano have?", answer: "88"),
];


// List of Subjects
List<Subject> subjects = [
  Subject(name: "Math", questions: mathQuestions),
  Subject(name: "Science", questions: scienceQuestions),
  Subject(name: "Filipino", questions: filipinoQuestions),
  Subject(name: "History", questions: historyQuestions),
  Subject(name: "Music", questions: musicQuestions),
];
