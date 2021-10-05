import 'package:get/get.dart';

import 'package:quizmathapp/app/modules/quiz/controllers/result_controller.dart';

import '../controllers/quiz_controller.dart';

class QuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultController>(
      () => ResultController(),
    );
    Get.lazyPut<QuizController>(
      () => QuizController(),
    );
  }
}
