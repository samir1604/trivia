part of 'question_provider.dart';

/// Max number of Questions
const int maxRecord = 60;

/// Min number of questions to take
const int minRecord = 1;

/// Max number of questions to take
const int maxQuestion = 20;

/// Question notifier
class QuestionNotifier extends StateNotifier<QuestionState> {
  /// Constructor
  QuestionNotifier({required this.getQuestionList})
      : super(const QuestionState.initial());

  /// Get Question List Use Case
  final GetQuestionList getQuestionList;

  var _index = 0;
  List<Question> _questionList = List<Question>.empty();

  /// Get list
  Future<void> loadList(String level) async {
    state = const QuestionState.loading();
    final result = await getQuestionList(level);

    result.fold((fail) => state = QuestionState.error(fail.message),
        (questionList) {

      /*
      final questions = List<Question>.generate(maxQuestion, (_) {
        return questionList
            .firstWhere((e) => e.id == _random(minRecord, maxRecord))
          ..answers.shuffle();
      });
      _questionList = List<Question>.from(questions);
      */
          _questionList = List<Question>.from(questionList);
      state = QuestionState.data(question: _questionList[_index]);
      _index++;
    });
  }

  static int _random(int min, int max) {
    return min + Random().nextInt(max + 1 - min);
  }
}
