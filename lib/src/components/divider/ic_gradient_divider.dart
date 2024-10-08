/// FileName ic_gradient_divider
/// 
/// @Author 杨雪松
/// @Email simonyang81@gmail.com
/// @Date 2023/5/29 16:39
///
/// @Description
///
///

import 'package:flutter/material.dart';

class ICGradientDivider extends StatelessWidget {

  final double height;
  final double width;
  final Gradient? gradient;

  const ICGradientDivider({Key? key,
    this.height = 1.0,
    this.width = double.infinity,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: gradient ?? LinearGradient(
          colors: [Theme.of(context).primaryColor.withOpacity(0.1), Theme.of(context).primaryColor, Theme.of(context).primaryColor.withOpacity(0.1)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}