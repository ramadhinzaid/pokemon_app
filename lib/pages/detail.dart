import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_app/components/custom_appbar.dart';
import 'package:pokemon_app/components/modals.dart';
import 'package:pokemon_app/components/moves_card.dart';
import 'package:pokemon_app/components/pokebal_jump.dart';
import 'package:pokemon_app/controllers/pokebag_controller.dart';
import 'package:pokemon_app/models/pokemon_model.dart';
import 'package:pokemon_app/themes/theme_controller.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key}) : super(key: key);

  final PokebagController pokebag = Get.put(PokebagController());
  final PokemonModel arg = Get.arguments as PokemonModel;
  final ThemeController theme = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAppbar(
                          subTitle: arg.name,
                        ),
                        Wrap(
                          runSpacing: 16,
                          children: arg.types!
                              .map((type) => MovesCard(
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    title: type.type?.name,
                                  ))
                              .toList(),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 200),
                          width: size.width,
                          // height: size.height,
                          decoration: BoxDecoration(
                              color: theme.isDarkMode.value
                                  ? Theme.of(context).primaryColor
                                  : Colors.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 32, bottom: 16),
                                  child: Text(
                                    "Moves",
                                    style: TextStyle(fontSize: 32),
                                  ),
                                ),
                                Wrap(
                                  runSpacing: 16,
                                  children: arg.moves!
                                      .map((move) => MovesCard(
                                            title: move.move?.name,
                                            textColor: Colors.white,
                                            backgroundColor:
                                                Theme.of(context).primaryColor,
                                          ))
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 250,
                            width: 250,
                            // color: Colors.white,
                            child: arg.image == null
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
                                    arg.image!,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  )
                  // Stack(
                  //   children: [
                  //     Container(
                  //       height: 100,
                  //       width: 100,
                  //       color: Colors.red,
                  //     ),
                  //     Container(
                  //       height: 100,
                  //       width: 100,
                  //       color: Colors.white,
                  //     )
                  //   ],
                  // )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: PokeBallJump(
                onTap: (value) {
                  // Modals.modalTapPokeBall(
                  //   context,
                  //   status: Status.berhasil,
                  //   pokemon: arg,
                  // );
                  int newValue = value!.dy.round();
                  if (newValue % 2 == 0) {
                    // Gagal
                    print("Kalah");
                    Modals.modalTapPokeBall(context);
                  } else {
                    // Berhasil
                    print("Menang");
                    // pokebag.addPokebag(arg);
                    Modals.modalTapPokeBall(
                      context,
                      status: Status.berhasil,
                      pokemon: arg,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
