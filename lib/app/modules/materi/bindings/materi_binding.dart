import 'package:get/get.dart';

import '../../webview/controllers/webview_controller.dart';
import '../controllers/materi_controller.dart';

class MateriBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MateriController>(
      () => MateriController(),
    );
    Get.lazyPut<WebviewController>(
      () => WebviewController(),
    );
  }
}
