import 'package:get/get.dart';

import '../../materi/controllers/materi_controller.dart';
import '../controllers/webview_controller.dart';

class WebviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebviewController>(
      () => WebviewController(),
    );
    Get.lazyPut<MateriController>(
      () => MateriController(),
    );
  }
}
