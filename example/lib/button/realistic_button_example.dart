/// FileName realistic_button_example
/// 
/// @Author 杨雪松
/// @Email simonyang81@gmail.com
/// @Date 2023/5/30 14:11
///
/// @Description
///
///

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icheer_widget/icheer_widget.dart';

class RealisticButtonExample extends StatelessWidget {
  const RealisticButtonExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Realistic Button Example'),),
      body: ICRealisticCircularButton(
        backgroundImage: 'assets/images/lock_bg.png',
        overlayImage: 'assets/images/lock.png',
        size: Get.width * 0.62,
        onPressed: () {
          Get.log('RealisticButtonExample pressed');
        },
      ),
    );
  }
}
