import 'package:get/get.dart';

import 'package:quizmathapp/app/modules/home/bindings/home_binding.dart';
import 'package:quizmathapp/app/modules/home/views/home_view.dart';
import 'package:quizmathapp/app/modules/informasi/bindings/informasi_binding.dart';
import 'package:quizmathapp/app/modules/informasi/views/informasi_view.dart';
import 'package:quizmathapp/app/modules/materi/bindings/materi_binding.dart';
import 'package:quizmathapp/app/modules/materi/views/materi_view.dart';
import 'package:quizmathapp/app/modules/quiz/bindings/quiz_binding.dart';
import 'package:quizmathapp/app/modules/quiz/views/quiz_view.dart';
import 'package:quizmathapp/app/modules/quiz/views/result_view.dart';
import 'package:quizmathapp/app/modules/splash/bindings/splash_binding.dart';
import 'package:quizmathapp/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.QUIZ,
      page: () => QuizView(),
      binding: QuizBinding(),
    ),
    GetPage(
      name: _Paths.INFORMASI,
      page: () => InformasiView(),
      binding: InformasiBinding(),
    ),
    GetPage(
      name: _Paths.MATERI,
      page: () => MateriView(),
      binding: MateriBinding(),
    ),
    GetPage(
      name: _Paths.RESULT,
      page: () => ResultView(),
      binding: QuizBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
