import 'package:quizmathapp/app/model/model_quizOption.dart';

class QuizModel {
  final String? statement;
  final List<QuizOptionModel>? options;
  final String? correctOptionId;

  QuizModel({this.statement, this.options, this.correctOptionId});
}
