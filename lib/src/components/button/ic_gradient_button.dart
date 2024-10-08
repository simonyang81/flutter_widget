/// FileName ic_gradient_button
///
/// @Author 杨雪松
/// @Email simonyang81@gmail.com
/// @Date 2023/3/13 14:19
///
/// @Description 渐变颜色的Button。目前只支持两种颜色从上至下的渐变方式
///
///

import 'package:flutter/material.dart';

class ICGradientButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;

  final BorderRadius? borderRadius;
  final Color? startColor;
  final Color? endColor;
  final double? width;
  final Color? splashColor;

  const ICGradientButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.startColor,
    this.endColor,
    this.width,
    this.borderRadius,
    this.splashColor,
  }) : super(key: key);

  @override
  State<ICGradientButton> createState() => _ICGradientButtonState();
}

class _ICGradientButtonState extends State<ICGradientButton> {
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius,
        boxShadow: [
          BoxShadow(
            color: widget.endColor?.withOpacity(.3) ?? Theme.of(context).primaryColor.withOpacity(.2),
            offset: const Offset(0, 8),
            blurRadius: 10,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.0, 1.0],
              colors: [widget.startColor ?? Theme.of(context).primaryColor.withOpacity(.5), Theme.of(context).primaryColor]
            ),
          ),
          child: InkResponse(
            borderRadius: widget.borderRadius,
            highlightShape: BoxShape.rectangle,
            splashColor: widget.endColor ?? Theme.of(context).primaryColor,
            containedInkWell: true,
            onTap: widget.onPressed,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
