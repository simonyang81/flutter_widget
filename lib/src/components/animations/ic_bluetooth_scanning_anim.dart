/// FileName ic_bluetooth_scanning
/// 
/// @Author 杨雪松
/// @Email simonyang81@gmail.com
/// @Date 2023/5/26 09:07
///
/// @Description
///
///

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ICBluetoothScanningAnim extends StatelessWidget {

  final Color? color;
  final double? iconSize;
  final double? rippleSize;
  final Widget? centerWidget;
  final AnimationController? controller;
  final double borderWidth;

  const ICBluetoothScanningAnim({
    Key? key,
    this.color,
    this.iconSize,
    this.rippleSize,
    this.centerWidget,
    this.borderWidth = 6.0,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: centerWidget ?? Icon(Icons.bluetooth_searching, size: iconSize ?? 50, color: color ?? Theme.of(context).primaryColor,),
        ),
        SpinKitRipple(
          color: color ?? Theme.of(context).primaryColor,
          size: rippleSize ?? 200,
          borderWidth: borderWidth,
          controller: controller,
        ),
      ]
    );
  }

}
