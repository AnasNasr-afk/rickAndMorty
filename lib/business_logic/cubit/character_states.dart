import 'package:rick_morty/data/models/character_model.dart';

abstract class CharacterStates {}

class InitialCharacterState extends CharacterStates {}

class LoadingCharacterState extends CharacterStates {}

class LoadedCharacterState extends CharacterStates {
  final List<CharacterModel> characterModel;
  LoadedCharacterState(this.characterModel);
}

class ErrorCharacterState extends CharacterStates {
  final String error;
  ErrorCharacterState(this.error);
}
class ToggleSearchState extends CharacterStates {}

class SearchResultsUpdatedState extends CharacterStates {}