import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import 'package:get/get.dart';

import '../controllers/informasi_controller.dart';

class InformasiView extends GetView<InformasiController> {
  @override
  Widget build(BuildContext context) {
    String dataFB = r"x=\frac{-4 \pm \sqrt{4^2 - 432}}{21} hasilnya berapa?";
    String dataFBUbah = dataFB.replaceAll(r' ', r'\ ');
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Aplikasi'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              size: 100,
            ),
            Text("Budiman Rasyid"),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialMedia(
                  key: key,
                  asset: "assets/gambar/instagram.png",
                  text: "Instagram",
                  onTap: () => controller.openUrl(
                    'https://www.instagram.com/rsyd29/',
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                SocialMedia(
                  key: key,
                  asset: "assets/gambar/whatsapp.png",
                  text: "WhatsApp",
                  onTap: () => controller.openUrl(
                    'https://api.whatsapp.com/send?phone=6289636986438',
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                SocialMedia(
                  key: key,
                  asset: "assets/gambar/facebook.png",
                  text: "Facebook",
                  onTap: () => controller.openUrl(
                    'https://www.facebook.com',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SocialMedia extends StatelessWidget {
  const SocialMedia({
    Key? key,
    required this.asset,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String asset, text;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            asset,
            height: 24,
            width: 24,
          ),
          SizedBox(
            height: 5,
          ),
          Text(text),
        ],
      ),
    );
  }
}
