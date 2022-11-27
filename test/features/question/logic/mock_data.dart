import 'package:trivia/src/domain/entities/answer.dart';
import 'package:trivia/src/domain/entities/question.dart';

final mockData = [
  const Question(
    id: 1,
    description: '1) El sistema inmune es el responsable de:',
    answers: [
      Answer(
        id: 1,
        description: 'Mantener la homeostasia',
        isCorrect: true,
      ),
      Answer(
        id: 1,
        description: 'Proteger de sustancias químicas',
        isCorrect: false,
      ),
      Answer(
        id: 1,
        description: 'Proteger contra ITS',
        isCorrect: false,
      ),
      Answer(
        id: 1,
        description: 'Mantener al organismo',
        isCorrect: false,
      ),
    ],
  ),
  const Question(
    id: 2,
    description: '2) El sistema inmune:',
    answers: [
      Answer(
        id: 1,
        description: 'Repara y limpia tejidos',
        isCorrect: true,
      ),
      Answer(
        id: 1,
        description: 'Repara y limpia los huesos',
        isCorrect: false,
      ),
      Answer(
        id: 1,
        description: 'Repara y limpia los órganos',
        isCorrect: false,
      ),
      Answer(
        id: 1,
        description: 'Repara y limpia las células',
        isCorrect: false,
      ),
    ],
  ),
  const Question(
    id: 3,
    description: '3) El sistema inmune:',
    answers: [
      Answer(
        id: 1,
        description: 'Elimina moléculas nocivas',
        isCorrect: true,
      ),
      Answer(
        id: 1,
        description: 'Elimina las drogas',
        isCorrect: false,
      ),
      Answer(
        id: 1,
        description: 'Elimina los tóxicos',
        isCorrect: false,
      ),
      Answer(
        id: 1,
        description: 'Elimina los metales',
        isCorrect: false,
      ),
    ],
  ),
];
