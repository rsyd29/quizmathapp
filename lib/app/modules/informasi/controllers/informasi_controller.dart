import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class InformasiController extends GetxController {
  Future<void> openUrl(
    String url, {
    bool forceWebView = false,
    bool enableJavaScript = false,
  }) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: forceWebView,
        enableJavaScript: enableJavaScript,
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
