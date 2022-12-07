part of 'question_provider.dart';

/// Get the maximum question item to show from list
const int maxRecords = 20;

/// Question notifier
class QuestionNotifier extends StateNotifier<QuestionState> {
  /// Constructor
  QuestionNotifier({
    required this.getQuestionListUseCase,
    int? maxQuestionLength,
  })  : _maxQuestionLength = maxQuestionLength ?? maxRecords,
        super(const QuestionState.initial());

  final int _maxQuestionLength;
  var _index = 0;

  /// Get Question List Use Case
  final GetQuestionList getQuestionListUseCase;

  List<Question> _questionList = [];

  void _updateQuestionState() {
    state = QuestionState.data(
      data: QuestionData.create(
        _index,
        _maxQuestionLength,
        _questionList[_index],
      ),
    );
    _index++;
  }

  /// Get next question
  void getNext() {
    if (_index < _questionList.length) {
      _updateQuestionState();
    }
  }

  /// Get list
  Future<void> loadList(String level) async {
    state = const QuestionState.loading();
    final result = await getQuestionListUseCase(level);

    result.fold((fail) => state = QuestionState.error(fail.message),
        (questionList) {
      _questionList = questionList.getRandomList(_maxQuestionLength);

      _questionList = _questionList
          .map((e) => e.copyWith(answers: e.answers.getUnOrderList()))
          .toList();

      _updateQuestionState();
    });
  }
}
