import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:pokemon_app/controllers/storage_manager.dart';
import 'package:pokemon_app/models/pokemon_model.dart';

class PokebagController extends GetxController {
  RxList<PokebagModel> listPokebag = <PokebagModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    readPokebag();
  }

  void addPokebag(PokemonModel pokemon, String name) async {
    listPokebag.add(PokebagModel(
      pokemon: pokemon,
      name: name,
    ));
    // listPokebag.map((e) => newList.add(e)).toList();

    StorageManager.saveData("pokebag", jsonEncode(listPokebag));
  }

  void deletePokebag(String name) async {
    listPokebag.removeWhere((pokebag) => pokebag.name == name);
    StorageManager.saveData("pokebag", jsonEncode(listPokebag));
  }

  void readPokebag() async {
    // await StorageManager.deleteData("pokebag");
    final data = await StorageManager.readData("pokebag");
    if (data != null) {
      var list = jsonDecode(data);
      var a = list.map((e) => listPokebag.add(PokebagModel.fromJson(e)));

      // ignore: avoid_print
      print(a);
    }
  }
}
