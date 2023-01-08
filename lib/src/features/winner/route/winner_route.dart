import 'package:go_router/go_router.dart';
import 'package:trivia/src/core/level_enum.dart';
import 'package:trivia/src/features/winner/winner_page.dart';

/// Path to winner page
const winnerPathRoute = 'winner';

/// Winner Routes
List<GoRoute> winnerRoute({List<GoRoute> subRoutes = const <GoRoute>[]}) => [
      GoRoute(
        path: winnerPathRoute,
        pageBuilder: (context, state) => NoTransitionPage(
          child: WinnerPage(
            key: state.pageKey,
            level: state.extra! as Level,
          ),
        ),
        routes: subRoutes,
      )
    ];
