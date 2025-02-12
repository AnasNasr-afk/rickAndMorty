import 'package:flutter/material.dart';
import 'package:rick_morty/data/models/character_model.dart';
import 'package:rick_morty/helper/app_strings.dart';
import 'package:rick_morty/helper/color_manager.dart';

class CharacterItem extends StatelessWidget {
  final CharacterModel characterModel;

  const CharacterItem({super.key, required this.characterModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.all(5),
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      decoration: BoxDecoration(
        color: ColorManager.mainWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            characterModel.name,
            style: const TextStyle(
              height: 1.3,
              fontSize: 16,
              color: ColorManager.mainWhite,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: Container(
            color: ColorManager.mainGrey,
            child: characterModel.image.isNotEmpty
                ? FadeInImage.assetNetwork(
                    placeholder: 'assets/images/empty.jpg',
                    image: characterModel.image,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    emptyImage,
                    fit: BoxFit.cover,
                  )),
      ),
    );
  }
}
