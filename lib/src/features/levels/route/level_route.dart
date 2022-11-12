import 'package:go_router/go_router.dart';
import 'package:trivia/src/features/levels/ui/levels_page.dart';

/// Path to levels page
const levelsPathRoute = 'levels';

/// Levels Routes
List<GoRoute> levelsRoute({List<GoRoute> subRoutes = const <GoRoute>[]}) => [
      GoRoute(
        path: levelsPathRoute,
        pageBuilder: (context, state) => NoTransitionPage(
          child: LevelsPage(key: state.pageKey),
        ),
        routes: subRoutes,
      )
    ];
