import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/business_logic/cubit/character_cubit.dart';
import 'package:rick_morty/business_logic/cubit/character_states.dart';
import 'package:rick_morty/helper/color_manager.dart';

import '../../../data/models/character_model.dart';
import '../../widgets/character_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<CharacterModel> allCharacters;
  late List<CharacterModel> allSearchCharacters;
  bool isSearching = false;

  TextEditingController searchController = TextEditingController();

  Widget searchTextField() {
    return TextField(
      controller: searchController,
      cursorColor: ColorManager.mainGrey,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Find a character ...',
        hintStyle: TextStyle(
          color: ColorManager.mainGrey,
          fontSize: 18,
        ),
      ),
      onChanged: (searchedCharacter) {
        addSearchedCharacterToListItem(searchedCharacter);
      },
    );
  }

  void addSearchedCharacterToListItem(String searchedCharacter) {
    setState(() {
      allSearchCharacters = allCharacters
          .where((singleCharacter) =>
          singleCharacter.name.toLowerCase().startsWith(searchedCharacter))
          .toList();
    });
  }


  List<Widget> buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
            onPressed: () {
              clearSearch();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.clear,
              color: ColorManager.mainGrey,
            )),
      ];
    } else {
      return [
        IconButton(
            onPressed: startSearch,
            icon: const Icon(
              Icons.search,
              color: ColorManager.mainGrey,
            )),
      ];
    }
  }

  void startSearch() {
    ModalRoute.of(context)
        ?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
    setState(() {
      isSearching = true;
    });
  }

  void stopSearch() {
    clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void clearSearch() {
    setState(() {
      searchController.clear();
      allSearchCharacters = allCharacters;
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    // final cubit = CharacterCubit.get(context); // ✅ Get cubit once at build time
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.mainYellow,
        title: isSearching
            ? searchTextField()
            : const Text(
                'Characters',
                style: TextStyle(color: ColorManager.mainGrey),
              ),
        actions: buildAppBarActions(),
        leading: isSearching ?const BackButton(
          color: ColorManager.mainGrey,
        ) : Container(),
      ),
      body: buildBlocWidget(),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharacterCubit, CharacterStates>(
      builder: (context, state) {
        if (state is LoadedCharacterState) {
          allCharacters = state.characterModel;
          // allSearchCharacters = []; //
          return buildLoadedListWidgets();
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorManager.mainYellow,
            ),
          );
        }
      },
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: ColorManager.mainGrey,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    List<CharacterModel> displayList = searchController.text.isEmpty
        ? allCharacters
        : allSearchCharacters;

    if (displayList.isEmpty) {
      return const Center(
        child:  Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search_off, size: 60, color: Colors.white),
              SizedBox(height: 10),
              Text(
                'No characters found!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      padding: const EdgeInsets.all(5),
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: displayList.length,
      itemBuilder: (context, index) {
        return CharacterItem(characterModel: displayList[index]);
      },
    );
  }
}
