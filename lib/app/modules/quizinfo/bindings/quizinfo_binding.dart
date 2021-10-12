import 'package:get/get.dart';

import '../controllers/quizinfo_controller.dart';

class QuizinfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizinfoController>(
      () => QuizinfoController(),
    );
  }
}
