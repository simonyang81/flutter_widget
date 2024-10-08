/// FileName bluetooth_scanning_example
/// 
/// @Author 杨雪松
/// @Email simonyang81@gmail.com
/// @Date 2023/5/26 09:11
///
/// @Description
///
///

import 'package:flutter/material.dart';
import 'package:icheer_widget/icheer_widget.dart';

class BluetoothScanningExample extends StatelessWidget {
  const BluetoothScanningExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 50,),
        ICBluetoothScanningAnim(
          color: Colors.red,
        ),
      ],
    );
  }
}
