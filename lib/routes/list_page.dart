import 'package:get/route_manager.dart';
import 'package:pokemon_app/pages/detail.dart';
import 'package:pokemon_app/pages/home.dart';
import 'package:pokemon_app/pages/pokebag.dart';
import 'package:pokemon_app/routes/route_name.dart';

class ListPage {
  static List<GetPage> pages = [
    GetPage(name: RouteName.home, page: () => HomePage()),
    GetPage(name: RouteName.detailPage, page: () => DetailPage()),
    GetPage(name: RouteName.pokeBag, page: () => PokeBag()),
  ];
}
