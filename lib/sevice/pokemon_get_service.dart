import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokemonapp/model/pokemon_model.dart';

class PokemonGetService {
  static Future<PokemonModel?> getPokemon() async {
    try {
      Response response = await Dio().get(
          "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");

      if (response.statusCode == 200) {
        return PokemonModel.fromJson(response.data);
      }
    } catch (e) {
      return "No internet connection" as PokemonModel;
    }
  }
}
