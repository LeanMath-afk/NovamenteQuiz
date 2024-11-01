import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Map<String, Object>> questions = [
    {
      'question': 'Qual é a capital da França?',
      'answers': [
        {'text': 'Paris', 'isCorrect': true},
        {'text': 'Londres', 'isCorrect': false},
        {'text': 'Roma', 'isCorrect': false},
      ],
    },
    {
      'question': 'Qual é o planeta mais próximo do Sol?',
      'answers': [
        {'text': 'Vênus', 'isCorrect': false},
        {'text': 'Mercúrio', 'isCorrect': true},
        {'text': 'Marte', 'isCorrect': false},
      ],
    },
    {
      'question': 'Qual é a moeda do Brasil?',
      'answers': [
        {'text': 'Real', 'isCorrect': true},
        {'text': 'Dolar', 'isCorrect': false},
        {'text': 'Euro', 'isCorrect': false},
      ],
    },
    {
      'question': 'Qual é a capital da Bahia?',
      'answers': [
        {'text': 'Salvador', 'isCorrect': true},
        {'text': 'Belo Hrizonte', 'isCorrect': false},
        {'text': 'Rio Branco', 'isCorrect': false},
      ],
    },
    {
      'question': 'Quanto é 2x3+6 ?',
      'answers': [
        {'text': '12', 'isCorrect': true},
        {'text': '18', 'isCorrect': false},
        {'text': '16', 'isCorrect': false},
      ],
    },
    {
      'question': 'Quem escreveu "Dom Casmurro"?',
      'answers': [
        {'text': 'Machado de Assis', 'isCorrect': true},
        {'text': 'Leandro Matheus', 'isCorrect': false},
        {'text': 'Lima Barreto', 'isCorrect': false},
      ],
    },
    {
      'question': 'Qual é a fórmula química da água?',
      'answers': [
        {'text': 'H2O', 'isCorrect': true},
        {'text': 'O2', 'isCorrect': false},
        {'text': 'CO2', 'isCorrect': false},
      ],
    },
    {
      'question': 'Quantos continentes existem no mundo?',
      'answers': [
        {'text': '5', 'isCorrect': false},
        {'text': '6', 'isCorrect': false},
        {'text': '7', 'isCorrect': true},
      ],
    },
    {
      'question': 'Quantos dedos tem um humano?',
      'answers': [
        {'text': '20', 'isCorrect': true},
        {'text': '10', 'isCorrect': false},
        {'text': '5', 'isCorrect': false},
      ],
    },
  ];

  int questionIndex = 0;
  int score = 0;

  void answerQuestion(bool isCorrect) {
    setState(() {
      if (isCorrect) {
        score++;
      }
      questionIndex++;
    });
  }

  void restartQuiz() {
    setState(() {
      questionIndex = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: questionIndex < questions.length
          ? Quiz(
              question: questions[questionIndex]['question'] as String,
              answers: questions[questionIndex]['answers'] as List<Map<String, Object>>,
              answerQuestion: answerQuestion,
            )
          : Result(score: score, restartQuiz: restartQuiz),
    );
  }
}

class Quiz extends StatelessWidget {
  final String question;
  final List<Map<String, Object>> answers;
  final Function(bool) answerQuestion;

  Quiz({
    required this.question,
    required this.answers,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        ...answers.map((answer) {
          return ElevatedButton(
            onPressed: () => answerQuestion(answer['isCorrect'] as bool),
            child: Text(answer['text'] as String),
          );
        }).toList(),
      ],
    );
  }
}

class Result extends StatelessWidget {
  final int score;
  final VoidCallback restartQuiz;

  Result({required this.score, required this.restartQuiz});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Pontuação: $score',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: restartQuiz,
            child: Text('Reiniciar Quiz'),
          ),
        ],
      ),
    );
  }
}
