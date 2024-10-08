/// FileName divider_example
/// 
/// @Author 杨雪松
/// @Email simonyang81@gmail.com
/// @Date 2023/5/29 16:55
///
/// @Description
///
///

import 'package:flutter/material.dart';
import 'package:icheer_widget/icheer_widget.dart';

class DividerExample extends StatelessWidget {
  const DividerExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Divider Example'),),
      body: _buildContent(),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildContent() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ICGradientDivider(),
      ),
    );
  }

}
