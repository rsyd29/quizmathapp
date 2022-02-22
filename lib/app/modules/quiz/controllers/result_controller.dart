import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class ResultController extends GetxController {
  late AudioPlayer audioPlayer;
  @override
  void onInit() {
    super.onInit();
    print('jalankan audioPlayer');
    audioPlayer = AudioPlayer();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.dispose();
    audioPlayer.dispose();
  }

  void playSound(String url) async {
    await audioPlayer.play(url);
  }
}
