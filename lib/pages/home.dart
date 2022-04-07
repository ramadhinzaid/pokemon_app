import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_app/components/custom_appbar.dart';
import 'package:pokemon_app/components/loader.dart';
import 'package:pokemon_app/components/pokemon_card.dart';
import 'package:pokemon_app/controllers/pokemon_controller.dart';
import 'package:pokemon_app/models/pokemon_model.dart';
import 'package:pokemon_app/themes/theme_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final PokemonController pokemon = Get.put(PokemonController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppbar(subTitle: "Pokedex"),
                Obx(
                  () {
                    if (pokemon.isLoading.value) {
                      return const ListLoader();
                    } else {
                      return Column(
                        children: [
                          size.width >= 809
                              ? GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: pokemon.listPokemon.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16,
                                    childAspectRatio: 216 / 130,
                                  ),
                                  itemBuilder: (ctx, idx) {
                                    PokemonModel pokemonModel =
                                        pokemon.listPokemon[idx];
                                    return PokemonCard(
                                      pokemonModel: pokemonModel,
                                    );
                                  })
                              : ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: pokemon.listPokemon.length,
                                  itemBuilder: (ctx, idx) {
                                    PokemonModel pokemonModel =
                                        pokemon.listPokemon[idx];
                                    return PokemonCard(
                                      pokemonModel: pokemonModel,
                                    );
                                  }),
                          if (pokemon.isLoadingMore.value)
                            const ListLoader(length: 2),
                        ],
                      );
                    }
                  },
                ),
                GestureDetector(
                  onTap: () => pokemon.showMore(),
                  child: Container(
                    height: 49,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).primaryColor,
                    ),
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                    margin: const EdgeInsets.only(top: 32),
                    child: Text(
                      "Show More",
                      style: TextStyle(
                        color: Theme.of(context).backgroundColor,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.put(ThemeController()).changeTheme(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
