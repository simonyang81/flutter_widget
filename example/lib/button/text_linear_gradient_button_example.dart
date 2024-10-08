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

class TextLinearGradientButtonExample extends StatelessWidget {
  const TextLinearGradientButtonExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Linear Gradient Button Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: ICTextGradientButton(
                    // size: const Size(100, 50),
                    onPressed: () {
                      debugPrint('TextLinearGradientButton pressed');
                    },
                    text: const Text('按钮 1', style: TextStyle(color: Colors.white, fontSize: 16),),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: ICTextGradientButton(
                    // size: const Size(100, 50),
                    onPressed: () {
                      debugPrint('TextLinearGradientButton pressed');
                    },
                    text: const Text('按钮 1', style: TextStyle(color: Colors.white, fontSize: 16),),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10,),

            ICTextGradientButton(
              startColor: Colors.deepPurpleAccent.shade100,
              endColor: Colors.deepPurpleAccent,
              size: const Size(200, 50),
              onPressed: () {
                debugPrint('TextLinearGradientButton pressed');
              },
              text: const Text('按钮 2', style: TextStyle(color: Colors.white, fontSize: 20),),
            ),

            const SizedBox(height: 10,),

            const ICTextGradientButton(
              size: Size(200, 50),
              onPressed: null,
              text: Text('按钮 2', style: TextStyle(fontSize: 20),),
            ),

            const SizedBox(height: 10,),

            const ElevatedButton(

                onPressed: null, child: Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text('ElevatedButton', style: TextStyle(fontSize: 30),),
                )),
          ],
        ),
      )
    );
  }
}
