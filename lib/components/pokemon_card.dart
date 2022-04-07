import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_app/models/pokemon_model.dart';
import 'package:pokemon_app/routes/route_name.dart';

class PokemonCard extends StatelessWidget {
  final PokemonModel? pokemonModel;
  const PokemonCard({Key? key, this.pokemonModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(RouteName.detailPage, arguments: pokemonModel),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Stack(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  pokemonModel?.name ?? "No Name",
                  style: const TextStyle(
                    // color: Color(0xFF161616),
                    fontSize: 24,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  height: 100,
                  width: 100,
                  // color: Colors.red,
                  child: pokemonModel?.image == null
                      ? const Center(
                          child: Text(
                            "No Image",
                            style: TextStyle(
                              // color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        )
                      : Image.network(
                          pokemonModel!.image!,
                          fit: BoxFit.cover,
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
