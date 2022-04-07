import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_app/routes/route_name.dart';

class CustomAppbar extends StatelessWidget {
  final String? subTitle;
  final bool onBagPage;
  const CustomAppbar({
    Key? key,
    this.subTitle,
    this.onBagPage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Get.toNamed(RouteName.home),
              child: const Text(
                "Home",
                style: TextStyle(
                  // color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            if (!onBagPage)
              GestureDetector(
                onTap: () => Get.toNamed(RouteName.pokeBag),
                child: const Text(
                  "Pokebag",
                  style: TextStyle(
                    // color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            subTitle ?? "Pokedex",
            style: const TextStyle(
              // color: Colors.black,
              fontSize: 32,
            ),
          ),
        ),
      ],
    );
  }
}
