import 'package:get/get.dart';

import '../../materi/controllers/materi_controller.dart';
import '../../webview/controllers/webview_controller.dart';
import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
    Get.lazyPut<MateriController>(
      () => MateriController(),
    );
    Get.lazyPut<WebviewController>(
      () => WebviewController(),
    );
  }
}
