import 'package:get/get.dart';

import '../modules/album/bindings/album_binding.dart';
import '../modules/album/views/album_view.dart';
import '../modules/counter/bindings/counter_binding.dart';
import '../modules/counter/views/counter_view.dart';
import '../modules/formulir/bindings/formulir_binding.dart';
import '../modules/formulir/views/formulir_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/post/bindings/post_binding.dart';
import '../modules/post/views/post_view.dart';
import '../modules/produk/bindings/produk_binding.dart';
import '../modules/produk/views/output_produk_view.dart';
import '../modules/produk/views/produk_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.COUNTER,
      page: () => CounterView(),
      binding: CounterBinding(),
    ),
    GetPage(
      name: _Paths.FORMULIR,
      page: () => FormulirView(),
      binding: FormulirBinding(),
    ),
    GetPage(
      name: _Paths.PRODUK,
      page: () => TokoView(),
      binding: ProdukBinding(),
    ),
    // kalau mau route ke output juga
    GetPage(
      name: '/produk/output',
      page: () => const ProdukOutput(),
      binding: ProdukBinding(),
    ),
    GetPage(
      name: _Paths.POST,
      page: () => PostView(),
      binding: PostBinding(),
    ),
    GetPage(
      name: _Paths.ALBUM,
      page: () => AlbumView(),
      binding: AlbumBinding(),
    ),
  ];
}
