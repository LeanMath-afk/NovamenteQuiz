import 'package:flutter/material.dart';
import 'TelaResultado.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Map<String, Object>> questions = [
    {
      'question': 'Qual é a capital da França?',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Flag_of_France_%281794%E2%80%931815%2C_1830%E2%80%931974%2C_2020%E2%80%93present%29.svg/1920px-Flag_of_France_%281794%E2%80%931815%2C_1830%E2%80%931974%2C_2020%E2%80%93present%29.svg.png',
      'answers': [
        {'text': 'Paris', 'isCorrect': true},
        {'text': 'Londres', 'isCorrect': false},
        {'text': 'Roma', 'isCorrect': false},
      ],
    },
    {
      'question': 'Qual é o planeta mais próximo do Sol?',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/a/ae/Planets2013-unlabeled.jpg',
      'answers': [
        {'text': 'Vênus', 'isCorrect': false},
        {'text': 'Mercúrio', 'isCorrect': true},
        {'text': 'Marte', 'isCorrect': false},
      ],
    },
    {
      'question': 'Qual é a moeda do EUA?',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/USDnotes.png/1280px-USDnotes.png',
      'answers': [
        {'text': 'Dolar', 'isCorrect': true},
        {'text': 'Money', 'isCorrect': false},
        {'text': 'Cash', 'isCorrect': false},
      ],
    },
    {
      'question': 'Qual é a capital da Bahia?',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Bahia_in_Brazil.svg/1024px-Bahia_in_Brazil.svg.png',
      'answers': [
        {'text': 'Salvador', 'isCorrect': true},
        {'text': 'Xique-Xique', 'isCorrect': false},
        {'text': 'Feira de Santana', 'isCorrect': false},
      ],
    },
    {
      'question': 'Quanto é 2x3+6?',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Venn_A_intersect_B.svg/1280px-Venn_A_intersect_B.svg.png',
      'answers': [
        {'text': '12', 'isCorrect': true},
        {'text': '2', 'isCorrect': false},
        {'text': '106', 'isCorrect': false},
      ],
    },
    {
      'question': 'Quem escreveu "Dom Casmurro"?',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/d/d3/BibliothekSG.jpg',
      'answers': [
        {'text': 'Machado de Assis', 'isCorrect': true},
        {'text': 'Leandro Matheus', 'isCorrect': false},
        {'text': 'Paula Tejano', 'isCorrect': false},
      ],
    },
    {
      'question': 'Qual é a fórmula química da água?',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Fluorescence_rainbow.JPG/1280px-Fluorescence_rainbow.JPG',
      'answers': [
        {'text': 'H2O', 'isCorrect': true},
        {'text': 'O2', 'isCorrect': false},
        {'text': 'CO2', 'isCorrect': false},
      ],
    },
    {
      'question': 'Quantos continentes existem no mundo?',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Association_of_National_Olympic_Committees.svg/1920px-Association_of_National_Olympic_Committees.svg.png',
      'answers': [
        {'text': '5', 'isCorrect': false},
        {'text': '6', 'isCorrect': false},
        {'text': '7', 'isCorrect': true},
      ],
    },
    {
      'question': 'Quantos dedos tem um humano?',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Human_pedigree.jpg/800px-Human_pedigree.jpg',
      'answers': [
        {'text': '20', 'isCorrect': true},
        {'text': '10', 'isCorrect': false},
        {'text': '5', 'isCorrect': false},
      ],
    },
    {
      'question': 'Qual é a capital do Japão?',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Flag_of_Japan.svg/1920px-Flag_of_Japan.svg.png',
      'answers': [
        {'text': 'Tóquio', 'isCorrect': true},
        {'text': 'Tekomo nakama', 'isCorrect': false},
        {'text': 'Tesoku nashota', 'isCorrect': false},
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 5, 142, 255),
        title: Text('Quiz em Dart'),
      ),
      body: questionIndex < questions.length
          ? Quiz(
              question: questions[questionIndex]['question'] as String,
              imageUrl: questions[questionIndex]['image'] as String,
              answers: questions[questionIndex]['answers']
                  as List<Map<String, Object>>,
              answerQuestion: answerQuestion,
            )
          : Result(score: score),
    );
  }
}

class Quiz extends StatelessWidget {
  final String question;
  final String imageUrl;
  final List<Map<String, Object>> answers;
  final Function(bool) answerQuestion;

  Quiz({
    required this.question,
    required this.imageUrl,
    required this.answers,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              question,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Image.network(
            imageUrl,
            height: 300,
            width: 400,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          ...answers.map((answer) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () => answerQuestion(answer['isCorrect'] as bool),
                child: Text(answer['text'] as String),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
