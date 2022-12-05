part of 'question_provider.dart';

/// Get the maximum question item to show from list
const int maxRecords = 20;

/// Question notifier
class QuestionNotifier extends StateNotifier<QuestionState> {
  /// Constructor
  QuestionNotifier({
    required this.getQuestionList,
    int? maxQuestionLength,
  })  : _maxQuestionLength = maxQuestionLength ?? maxRecords,
        super(const QuestionState.initial());

  final int _maxQuestionLength;
  var _index = 0;

  /// Get Question List Use Case
  final GetQuestionList getQuestionList;

  List<Question> _questionList = [];

  /// Get next question
  void getNext() {
    if (_questionList.length < _index) {
      state = QuestionState.data(question: _questionList[_index]);
      _index++;
    }
  }

  /// Get list
  Future<void> loadList(String level) async {
    state = const QuestionState.loading();
    final result = await getQuestionList(level);

    result.fold((fail) => state = QuestionState.error(fail.message),
        (questionList) {
      _questionList = questionList.getRandomList(_maxQuestionLength);

      _questionList = _questionList
          .map((e) => e.copyWith(answers: e.answers.getUnOrderList()))
          .toList();

      state = QuestionState.data(question: _questionList[_index]);
      _index++;
    });
  }
}
