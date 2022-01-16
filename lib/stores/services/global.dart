import 'package:cloudmusic/tools/storage.dart';
import 'package:get/get.dart';

class GlobalStore extends GetxController {
  static GlobalStore get to => Get.find();

  static const appHasBeenOpenedKey = 'app_has_been_opened';

  bool isFirstOpen = false;

  @override
  void onInit() {
    super.onInit();
    isFirstOpen = !Storage.to.getBool(appHasBeenOpenedKey);
  }

  // 用户打开过 app 了
  Future<bool> appOpened() {
    return Storage.to.setBool(appHasBeenOpenedKey, true);
  }
}
