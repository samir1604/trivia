import 'package:go_router/go_router.dart';
import 'package:trivia/src/core/level_enum.dart';
import 'package:trivia/src/features/question/ui/question_page.dart';

/// Path to question page
const questionPathRoute = 'question';
/// Level key
const levelKey = 'level';

/// Question Route
List<GoRoute> questionRoute({List<GoRoute> subRoutes = const <GoRoute>[]}) => [
      GoRoute(
        path: questionPathRoute,
        pageBuilder: (context, state) => NoTransitionPage(
          child: QuestionPage(
            key: state.pageKey,
            level: state.extra! as Level,
          ),
        ),
        routes: subRoutes,
      ),
    ];
