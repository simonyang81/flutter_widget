/// FileName ic_custom_switch
/// 
/// @Author 杨雪松
/// @Email simonyang81@gmail.com
/// @Date 2023/5/25 14:38
///
/// @Description
///
///

import 'package:flutter/material.dart';

class ICCustomSwitch extends Switch {

  final double scale;

  const ICCustomSwitch(this.scale, {
    required super.value,
    required super.onChanged,

    super.key,
    super.activeColor,
    super.activeTrackColor,
    super.inactiveThumbColor,
    super.inactiveTrackColor,
    super.activeThumbImage,
    super.onActiveThumbImageError,
    super.inactiveThumbImage,
    super.onInactiveThumbImageError,
    super.thumbColor,
    super.trackColor,
    super.trackOutlineColor,
    super.thumbIcon,
    super.materialTapTargetSize,
    super.dragStartBehavior,
    super.mouseCursor,
    super.focusColor,
    super.hoverColor,
    super.overlayColor,
    super.splashRadius,
    super.focusNode,
    super.onFocusChange,
    super.autofocus,

  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: super.build(context),
    );
  }


}
