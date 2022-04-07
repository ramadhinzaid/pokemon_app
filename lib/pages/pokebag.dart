import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_app/components/custom_appbar.dart';
import 'package:pokemon_app/components/pokebag_card.dart';
import 'package:pokemon_app/controllers/pokebag_controller.dart';
import 'package:pokemon_app/models/pokemon_model.dart';

class PokeBag extends StatelessWidget {
  PokeBag({Key? key}) : super(key: key);
  final PokebagController pokebag = Get.put(PokebagController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const CustomAppbar(
                  subTitle: "Pokebag",
                  onBagPage: true,
                ),
                Obx(() {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: pokebag.listPokebag.length,
                      itemBuilder: (ctx, idx) {
                        PokebagModel pokebagModel = pokebag.listPokebag[idx];
                        return PokebagCard(
                          pokebagModel: pokebagModel,
                          onDelete: () =>
                              pokebag.deletePokebag(pokebagModel.name!),
                        );
                      });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
