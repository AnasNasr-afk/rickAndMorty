import 'package:flutter/material.dart';
import 'package:rick_morty/business_logic/cubit/character_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/data/models/character_model.dart';


import '../../data/repository/characters_repo.dart';

class CharacterCubit extends Cubit<CharacterStates> {
  final CharactersRepo charactersRepo;
  List<CharacterModel> characterModelList = [];

  CharacterCubit(this.charactersRepo) : super(InitialCharacterState());

  static CharacterCubit get(BuildContext context) => BlocProvider.of(context);



  List<CharacterModel> getAllCharacters() {
    charactersRepo.getAllCharacters().then((characterValue) {
      emit(LoadedCharacterState(characterValue));
      characterModelList = characterValue;
    }).catchError((error) {
      // print(error.toString());
    });
    return characterModelList;
  }

}
