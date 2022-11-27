part of 'question_provider.dart';

/// Question notifier
class QuestionNotifier extends StateNotifier<QuestionState> {
  /// Constructor
  QuestionNotifier({required this.getQuestionList})
      : super(const QuestionState.initial());

  /// Get Question List Use Case
  final GetQuestionList getQuestionList;

  List<Question> _questionList = List<Question>.empty();

  /// Get question list
  List<Question>? get questions => _questionList;

  /// Get list
  Future<void> getList(String level) async {

    state = const QuestionState.loading();
    final result = await getQuestionList(level);

    result.fold(
      (fail) => state = QuestionState.error(fail.message),
      (questionList) {
        _questionList = List<Question>.from(questionList);
        state = QuestionState.data(questionList: _questionList);
      }
    );
  }
}
