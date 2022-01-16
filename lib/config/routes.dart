import 'package:cloudmusic/pages/recommend/view.dart';
import 'package:get/route_manager.dart';

class Routes {
  static const initial = '/recommend';

  static final pages = [
    GetPage(name: Routes.initial, page: () => const RecommendPage())
  ];
}
