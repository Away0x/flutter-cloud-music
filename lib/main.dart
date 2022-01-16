import 'package:cloudmusic/config/app.dart';
import 'package:cloudmusic/config/routes.dart';
import 'package:cloudmusic/config/theme.dart';
import 'package:cloudmusic/stores/services/global.dart';
import 'package:cloudmusic/stores/services/user.dart';
import 'package:cloudmusic/tools/keyboard.dart';
import 'package:cloudmusic/tools/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  await initSystemUI();
  await initStore();
  runApp(const MyApp());
}

Future<void> initSystemUI() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 设置沉浸式导航
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: !GetPlatform.isWeb && GetPlatform.isAndroid
        ? Brightness.dark
        : Brightness.light,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  // 强制竖屏
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

Future<void> initStore() async {
  await Get.putAsync<Storage>(() => Storage().init());
  Get.put<GlobalStore>(GlobalStore());
  Get.put<UserStore>(UserStore());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppInfo.title,
      debugShowCheckedModeBanner: false,
      enableLog: true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ),
      initialRoute: Routes.initial,
      getPages: Routes.pages,
      builder: (context, child) {
        ScreenUtil.init(
          BoxConstraints(maxWidth: Get.width, maxHeight: Get.height),
          designSize: const Size(375, 812), // design by iphonex
        );

        return Scaffold(
          // Global GestureDetector that will dismiss the keyboard
          body: GestureDetector(
            onTap: () {
              KeyboardTools.hideKeyboard(context);
            },
            child: child,
          ),
        );
      },
    );
  }
}
