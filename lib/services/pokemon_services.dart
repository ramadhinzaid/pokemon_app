import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pokemon_app/models/exception_model.dart';
import 'package:pokemon_app/models/pokemon_model.dart';

import 'base_msg.dart';

class PokemonService {
  static Future<AllPokemonModel> getListPokemon(String url) async {
    List<PokemonModel> listPokemon = [];
    try {
      final request =
          await Dio().get(url).timeout(Duration(seconds: durationTimeOut));
      // final data = jsonDecode(request);
      if (request.statusCode == 200) {
        final data = request.data["results"] as List;
        for (var item in data) {
          listPokemon.add(await getDetailPokemon(item["url"]));
        }

        final newMap = {
          "nextUrl": request.data["next"],
          "prevUrl": request.data["previous"],
          "listPokemon": listPokemon,
        };
        return AllPokemonModel.fromJson(newMap);
      } else {
        throw "terjadi kesalahan saat memuat";
      }
    } on TimeoutException catch (_) {
      throw ExceptionModel(message: timeOutmsg, status: false);
    } on SocketException catch (_) {
      throw ExceptionModel(message: noConnectionmsg, status: false);
    } catch (e) {
      throw ExceptionModel(message: e.toString(), status: false);
    }
  }

  static Future<PokemonModel> getDetailPokemon(String url) async {
    try {
      final request =
          await Dio().get(url).timeout(Duration(seconds: durationTimeOut));
      if (request.statusCode == 200) {
        final data = request.data;

        final dataJson = {
          "image": data["sprites"]["front_default"],
          "moves": data["moves"],
          "name": data["name"],
          "types": data["types"],
          "url": url,
        };
        return PokemonModel.fromJson(dataJson);
      } else {
        throw "terjadi kesalahan saat memuat";
      }
    } on TimeoutException catch (_) {
      throw ExceptionModel(message: timeOutmsg, status: false);
    } on SocketException catch (_) {
      throw ExceptionModel(message: noConnectionmsg, status: false);
    } catch (e) {
      throw ExceptionModel(message: e.toString(), status: false);
    }
  }
}
