
import 'package:dio/dio.dart';
import 'package:rick_morty/data/models/character_model.dart';
import 'package:rick_morty/helper/app_strings.dart';

class ApiServices {
  late final Dio dio;

  ApiServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<CharacterModel>> getAllCharacters() async {
    try {
      final response = await dio.get('character');
      final List<dynamic> results = response.data['results'] ?? [];
      return results.map((json) => CharacterModel.fromJson(json)).toList();
    } catch (e) {
      // print("Error fetching characters: $e");
      return [];
    }
  }
}