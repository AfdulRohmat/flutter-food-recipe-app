import 'package:get/get.dart';

import 'package:flutter_food_shop_implement_restapi/app/modules/detail/bindings/detail_binding.dart';
import 'package:flutter_food_shop_implement_restapi/app/modules/detail/views/detail_view.dart';
import 'package:flutter_food_shop_implement_restapi/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_food_shop_implement_restapi/app/modules/home/views/home_view.dart';
import 'package:flutter_food_shop_implement_restapi/app/modules/video/bindings/video_binding.dart';
import 'package:flutter_food_shop_implement_restapi/app/modules/video/views/video_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO,
      page: () => VideoView(),
      binding: VideoBinding(),
    ),
  ];
}
