/// FileName toast_example
/// 
/// @Author 杨雪松
/// @Email simonyang81@gmail.com
/// @Date 2023/5/31 10:49
///
/// @Description
///
///
///

import 'package:flutter/material.dart';
import 'package:icheer_widget/icheer_widget.dart';

class ToastExample extends StatelessWidget {
  const ToastExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Toast Example'),),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                ICToast.showInCenter(text: '请打开手机蓝牙并靠近设备~',
                    background: const Color(0xFF0350A6).withOpacity(0.45),
                    textStyle: const TextStyle(color: Colors.white, fontSize: 16),
                    context: context);
              },
              child: const Text('show toast 1', style: TextStyle(fontSize: 18),)
            ),
            const SizedBox(height: 10,),
            TextButton(
                onPressed: () {
                  ICToast.showInCenter(text: '我是toast 2',
                      textStyle: const TextStyle(color: Colors.white), context: context);
                },
                child: const Text('show toast 2', style: TextStyle(fontSize: 18),)
            ),
          ],
        ),
      ),
    );
  }
}
