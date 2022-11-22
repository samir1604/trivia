import 'package:go_router/go_router.dart';
import 'package:trivia/src/features/home/route/home_route.dart';
import 'package:trivia/src/features/levels/route/level_route.dart';

/// Application router
GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: homeRoute(subRoutes: levelsRoute()),
);
