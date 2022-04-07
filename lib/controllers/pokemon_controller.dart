import 'package:get/get.dart';
import 'package:pokemon_app/models/pokemon_model.dart';
import 'package:pokemon_app/services/base_url.dart';
import 'package:pokemon_app/services/pokemon_services.dart';

class PokemonController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingMore = false.obs;
  RxList<PokemonModel> listPokemon = <PokemonModel>[].obs;
  String? nextUrl = BaseUrl.api("?offset=0&limit=10"), previousUrl;
  @override
  void onInit() {
    super.onInit();
    getPokemon();
  }

  void getPokemon() async {
    try {
      isLoading(true);
      final allPokemon = await PokemonService.getListPokemon(nextUrl!);
      if (allPokemon.listPokemon != null) {
        listPokemon.addAll(allPokemon.listPokemon as Iterable<PokemonModel>);
      }
      nextUrl = allPokemon.nextUrl;
      previousUrl = allPokemon.prevUrl;
    } finally {
      isLoading(false);
    }
  }

  void showMore() async {
    try {
      isLoadingMore(true);
      final allPokemon = await PokemonService.getListPokemon(nextUrl!);
      if (allPokemon.listPokemon != null) {
        listPokemon.addAll(allPokemon.listPokemon as Iterable<PokemonModel>);
      }
      nextUrl = allPokemon.nextUrl;
      previousUrl = allPokemon.prevUrl;
    } finally {
      isLoadingMore(false);
    }
  }
}
