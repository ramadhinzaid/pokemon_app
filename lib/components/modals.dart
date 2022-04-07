import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_app/components/buttons.dart';
import 'package:pokemon_app/components/textfields.dart';
import 'package:pokemon_app/controllers/pokebag_controller.dart';
import 'package:pokemon_app/models/pokemon_model.dart';
import 'package:pokemon_app/routes/route_name.dart';
import 'package:pokemon_app/themes/theme_controller.dart';

enum Status { berhasil, gagal }

class Modals {
  static modalTapPokeBall(
    context, {
    Status status = Status.gagal,
    PokemonModel? pokemon,
  }) {
    PokebagController pokebag = Get.put(PokebagController());
    String name = "";
    final ThemeController theme = Get.put(ThemeController());
    final _formKey = GlobalKey<FormState>();
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return StatefulBuilder(builder: (newcontext, modalState) {
            return SingleChildScrollView(
              child: Container(
                  // height: status == Status.gagal ? 206 : 268,
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    color: theme.isDarkMode.value
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  padding: const EdgeInsets.only(
                      top: 32, left: 16, right: 16, bottom: 16),
                  child: status == Status.gagal
                      ? Column(
                          children: [
                            const Text(
                              "Sorry, lady luck not in your side!",
                              style: TextStyle(
                                // color: Colors.black,
                                fontSize: 32,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                height: 49,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0XFF0F62FE),
                                ),
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 6),
                                margin: const EdgeInsets.only(top: 32),
                                child: const Text(
                                  "Close",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            )
                          ],
                        )
                      : Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Gotcha!",
                                style: TextStyle(
                                  // color: Colors.black,
                                  fontSize: 32,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom <=
                                            70
                                        ? MediaQuery.of(context)
                                            .viewInsets
                                            .bottom
                                        : MediaQuery.of(context)
                                                .viewInsets
                                                .bottom -
                                            70),
                                child: TextFields(
                                  label:
                                      "Now enter your ${pokemon?.name} nickname",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.black)),
                                  onChanged: (text) {
                                    modalState(() {
                                      _formKey.currentState!.validate();
                                      name = text;
                                    });
                                  },
                                  validator: (text) {
                                    if (pokebag.listPokebag.any(
                                        (element) => element.name == text)) {
                                      return "Nickname already exist, use different name";
                                    }
                                  },
                                ),
                              ),
                              ButtonDefault(
                                title: "Submit",
                                onTap: () {
                                  _formKey.currentState!.validate();
                                  if (name != "") {
                                    if (pokebag.listPokebag.every(
                                        (element) => element.name != name)) {
                                      Navigator.pop(context);
                                      pokebag.addPokebag(pokemon!, name);
                                      modalConfirm(context);
                                    }
                                  }
                                },
                              ),
                            ],
                          ),
                        )),
            );
          });
        });
  }

  static modalConfirm(context) {
    final ThemeController theme = Get.put(ThemeController());

    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (ctx) => Container(
              height: 206,
              decoration: BoxDecoration(
                color: theme.isDarkMode.value
                    ? Theme.of(context).primaryColor
                    : Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.only(
                  top: 32, left: 16, right: 16, bottom: 16),
              child: Column(children: [
                const Text(
                  "Your Pokemon is safe and sound in your pokebag.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: ButtonDefault(
                      onTap: () => Navigator.pop(context),
                      title: "Close",
                      backgroundColor: Colors.white,
                      textColor: Colors.blue,
                      border: Border.all(color: Colors.blue),
                    )),
                    const SizedBox(width: 16),
                    Expanded(
                        child: ButtonDefault(
                      onTap: () {
                        Navigator.pop(context);
                        Get.toNamed(RouteName.pokeBag);
                      },
                      title: "See Pokebag",
                    ))
                  ],
                )
              ]),
            ));
  }
}
