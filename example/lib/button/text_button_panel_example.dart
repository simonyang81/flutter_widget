/// FileName text_button_panel_example
/// 
/// @Author 杨雪松
/// @Email simonyang81@gmail.com
/// @Date 2023/5/18 16:03
///
/// @Description
///
///

import 'package:flutter/material.dart';
import 'package:icheer_widget/icheer_widget.dart';

class TextButtonPanelExample extends StatefulWidget {
  const TextButtonPanelExample({Key? key}) : super(key: key);

  @override
  State<TextButtonPanelExample> createState() => _TextButtonPanelExampleState();
}

class _TextButtonPanelExampleState extends State<TextButtonPanelExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Button Panel Example', style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            ICTextButtonPanel(
              buttons: const [Text('按钮1'), Text('按钮2'), Text('按钮3'), ],
              buttonTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
              buttonOnTap: (index) {
                debugPrint('TextButtonPanel buttonOnTap index = $index');
              },
            ),

            const SizedBox(height: 20,),

            ICTextButtonPanel(
              startColor: Colors.deepPurpleAccent.shade100,
              endColor: Colors.deepPurpleAccent,
              buttons: const [Text('按钮1'), Text('按钮2'), Text('按钮3'), ],
              buttonTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
              buttonOnTap: (index) {
                debugPrint('TextButtonPanel buttonOnTap index = $index');
              },
            ),

            const SizedBox(height: 20,),

            ICTextButtonPanel(
              startColor: Colors.deepPurpleAccent.shade100,
              endColor: Colors.deepPurpleAccent,
              buttons: const [Text('按钮1'), Text('按钮2'), Text('按钮3'), ],
              buttonTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
              buttonOnTap: (index) {
                debugPrint('TextButtonPanel buttonOnTap index = $index');
              },
              size: const Size(300, 50),
            ),
          ],
        ),
      ),
    );
  }
}
