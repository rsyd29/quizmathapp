import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/materi_controller.dart';

class MateriView extends GetView<MateriController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MateriView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MateriView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
