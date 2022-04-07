import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_app/routes/list_page.dart';
import 'package:pokemon_app/routes/route_name.dart';
import 'package:pokemon_app/themes/theme_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  final ThemeController theme = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokemon App',
        theme: !theme.isDarkMode.value
            ? ThemeData.light()
                .copyWith(backgroundColor: const Color(0xFFF4F4F4))
            : ThemeData.dark(),
        initialRoute: RouteName.home,
        getPages: ListPage.pages,
      );
    });
  }
}
