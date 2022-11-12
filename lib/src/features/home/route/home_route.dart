import 'package:go_router/go_router.dart';
import 'package:trivia/src/features/home/ui/home_page.dart';

/// Path to home route
const homePathRoute = '/';

/// Home Routes
List<GoRoute> homeRoute({List<GoRoute> subRoutes = const <GoRoute>[]}) =>
    <GoRoute>[
      GoRoute(
        path: homePathRoute,
        pageBuilder: (context, state) => NoTransitionPage(
          child: HomePage(key: state.pageKey),
        ),
        routes: subRoutes,
      )
    ];
