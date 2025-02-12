import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/business_logic/cubit/character_cubit.dart';
import 'package:rick_morty/data/repository/characters_repo.dart';
import 'package:rick_morty/data/apiServices/api_services.dart';
import '../presentation/screens/homeScreen/home_screen.dart';
import 'routes.dart';

class AppRouter {
  late final CharactersRepo charactersRepo;
  late final CharacterCubit characterCubit;

  AppRouter() {
    charactersRepo = CharactersRepo(apiServices: ApiServices());
    characterCubit = CharacterCubit(charactersRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => characterCubit,
            child:  HomeScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
