import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia/src/theme/app_style.dart';

/// Get Trivia App Bar
AppBar getTriviaAppBar(
  BuildContext context, {
  required String title,
  required Widget leading,
  double leadingWidth = 50,
  bool centerTitle = false,
}) {
  return AppBar(
    centerTitle: centerTitle,
    elevation: 5,
    backgroundColor: kBoxBackgroundColor,
    leading: leading,
    leadingWidth: leadingWidth,
    title: Text(
      title,
      style: Theme.of(context).textTheme.headline3,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => context.pop(),
      ),
    ],
  );
}
