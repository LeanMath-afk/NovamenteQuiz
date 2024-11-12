import 'package:flutter/material.dart';
import 'quiz.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 5, 142, 255),
        title: Text('Quiz em Dart'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Jardin_du_Musee_Rodin_Paris_Le_Penseur_20050402_%2802%29.jpg/800px-Jardin_du_Musee_Rodin_Paris_Le_Penseur_20050402_%2802%29.jpg',
                height: 450,
                width: 300,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                'Bem-vindo ao Quiz!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Teste seus conhecimentos em várias áreas! Responda às perguntas e veja sua pontuação no final.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => QuizPage()),
                  );
                },
                child: Text('Iniciar Quiz', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
