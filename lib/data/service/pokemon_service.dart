import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokemonn/core/config/dio_config.dart';
import 'package:pokemonn/core/constants/project_urls.dart';

import '../model/pokemon_model.dart';

class PokemonGetService {
  static PokemonModel? resData;
  static Future<PokemonModel> getPokemon() async {
    try {
      Response response = await DioConfig().createRequest().get(ProjectUrls.myAPI);

      if (response.statusCode == 200) {
        resData = PokemonModel.fromJson(jsonDecode(response.data));
        return PokemonModel.fromJson(jsonDecode(response.data));
      } else {
        return PokemonModel.fromJson(response.data);
      }
    } catch (e) {
      return PokemonModel.fromJson({});
    }
  }
}
