/// FileName linear_gradient_button_example
/// 
/// @Author 杨雪松
/// @Email simonyang81@gmail.com
/// @Date 2023/5/12 17:50
///
/// @Description
///
///

import 'package:flutter/material.dart';
import 'package:icheer_widget/icheer_widget.dart';

class LinearGradientButtonExample extends StatelessWidget {
  const LinearGradientButtonExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Linear Gradient Button Example', style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ICGradientButton(
              width: 200,
              onPressed: () {
                debugPrint('LinearGradientButton pressed');
              },
              child: Row(
                children: const [
                  Icon(Icons.add, color: Colors.white, size: 30,),
                  SizedBox(width: 10,),
                  Text('Linear Gradient Button', style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
