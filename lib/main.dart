import 'package:flutter/material.dart';
import 'package:movie_browser/features/domain/provider.dart';
import 'package:movie_browser/features/presentation/router/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => StateManager(),
      child: Builder(
        builder: (context) {
          return MaterialApp.router(routerConfig: router);
        },
      ),
    ),
  );
}
