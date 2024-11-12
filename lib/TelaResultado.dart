import 'package:flutter/material.dart';
import 'TelaInicial.dart';  
import 'quiz.dart';  

class Result extends StatelessWidget {
  final int score;

  Result({required this.score});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Rock_won_the_title.jpg/1920px-Rock_won_the_title.jpg', 
            height: 300,
            width: 450,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Text(
            'Pontuação: $score',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => QuizPage()),
              );
            },
            child: Text('Reiniciar Quiz'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => StartPage()),
              );
            },
            child: Text('Retornar a tela inicial'),
          ),
        ],
      ),
    );
  }
}
