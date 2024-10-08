/// FileName asset_background_example
/// 
/// @Author 杨雪松
/// @Email simonyang81@gmail.com
/// @Date 2023/5/30 10:42
///
/// @Description
///
///

import 'package:flutter/material.dart';
import 'package:icheer_widget/icheer_widget.dart';

class AssetBackgroundExample extends StatelessWidget {
  const AssetBackgroundExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asset Background Example'),
      ),
      body: const Stack(
        children: [
          ICAssetBackground(assetName: 'assets/images/home_bg.png',),
          Center(
            child: Text('Asset Background Example', style: TextStyle(color: Colors.white, fontSize: 20),),
          ),
        ],
      ),
    );
  }
}
