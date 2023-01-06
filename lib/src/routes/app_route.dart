import 'package:go_router/go_router.dart';
import 'package:trivia/src/features/home/route/home_route.dart';
import 'package:trivia/src/features/levels/route/level_route.dart';
import 'package:trivia/src/features/question/route/question_route.dart';
import 'package:trivia/src/features/winner/route/winner_route.dart';

/// Application router
GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: homeRoute(
    subRoutes: levelsRoute(
      subRoutes: [ ...questionRoute(), ...winnerRoute() ],
    ),
  ),
  debugLogDiagnostics: true,
);
