// CharactersRepo.dart
import 'package:rick_morty/data/apiServices/api_services.dart';
import 'package:rick_morty/data/models/character_model.dart';

class CharactersRepo {
  final ApiServices apiServices;

  CharactersRepo({required this.apiServices});

  Future<List<CharacterModel>> getAllCharacters() async {
    return await apiServices.getAllCharacters();
  }
}