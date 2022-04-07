import 'package:get/get.dart';
import 'package:pokemon_app/controllers/storage_manager.dart';

import '../controllers/storage_manager.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  void changeTheme() async {
    final data = await StorageManager.readData("themeMode");
    if (data != null) {
      isDarkMode.value = !data;
    }
    StorageManager.saveData("themeMode", isDarkMode.value);
  }
}
