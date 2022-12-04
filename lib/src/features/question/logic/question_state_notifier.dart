part of 'question_provider.dart';

const int maxRecords = 20;

/// Question notifier
class QuestionNotifier extends StateNotifier<QuestionState> {
  /// Constructor
  QuestionNotifier({
    required this.getQuestionList,
  }) : super(const QuestionState.initial());

  /// Get Question List Use Case
  final GetQuestionList getQuestionList;

  List<Question> _questionList = [];

  /// Get list
  Future<void> loadList(String level) async {
    state = const QuestionState.loading();
    final result = await getQuestionList(level);

    result.fold((fail) => state = QuestionState.error(fail.message),
        (questionList) {
      _questionList = questionList.getRandomList(maxRecords);

      _questionList = _questionList
          .map((e) => e.copyWith(answers: e.answers.getUnOrderList()))
          .toList();

      state = QuestionState.data(question: _questionList[0]);
    });
  }
}
