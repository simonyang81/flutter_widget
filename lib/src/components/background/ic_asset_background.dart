/// FileName ic_asset_background
/// 
/// @Author 杨雪松
/// @Email simonyang81@gmail.com
/// @Date 2023/5/30 10:39
///
/// @Description
///
///

import 'package:flutter/material.dart';

class ICAssetBackground extends StatelessWidget {

  final String assetName;

  const ICAssetBackground({Key? key, required this.assetName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBackground();
  }

  Widget _buildBackground() {
    return SizedBox.expand(
      child: Image(
        image: AssetImage(assetName),
        fit: BoxFit.fill,
      ),
    );
  }

}
