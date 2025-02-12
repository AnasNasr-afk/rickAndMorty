import 'package:flutter/material.dart';
import 'package:rick_morty/router/app_router.dart';

void main() {
  runApp(RickMortyApp(appRouter: AppRouter(),));
}

class RickMortyApp extends StatelessWidget {

  final AppRouter appRouter;
  const RickMortyApp({super.key,
    required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Breaking Bad',
      onGenerateRoute: appRouter.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
