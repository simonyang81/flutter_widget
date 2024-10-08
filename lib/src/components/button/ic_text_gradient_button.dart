/// FileName ic_text_gradient_button
///
/// @Author 杨雪松
/// @Email simonyang81@gmail.com
/// @Date 2023/3/13 14:19
///
/// @Description 渐变颜色的TextButton。目前只支持两种颜色从上至下的渐变方式
///
///

import 'package:flutter/material.dart';
import 'package:icheer_widget/src/resources/app_resources.dart';

class ICTextGradientButton extends StatefulWidget {
  final Text text;
  final VoidCallback? onPressed;
  final Size? size;
  final BorderRadius? borderRadius;
  final Color? startColor;
  final Color? endColor;

  const ICTextGradientButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.size,
    this.startColor,
    this.endColor,
    this.borderRadius,
  }) : super(key: key);

  @override
  State<ICTextGradientButton> createState() => _ICTextGradientButtonState();
}

class _ICTextGradientButtonState extends State<ICTextGradientButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        boxShadow: getBoxShadow(),
      ),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius ?? const BorderRadius.all(Radius.circular(5.0)),
            gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, stops: const [
              0.0,
              1.0
            ], colors: [
              enabled ? widget.startColor ?? Theme.of(context).primaryColor.withOpacity(.2) : AppColors.nearlyGrey,
              enabled ? widget.endColor ?? Theme.of(context).primaryColor : AppColors.nearlyGrey,
            ]),
          ),
          child: InkResponse(
            canRequestFocus: enabled,
            borderRadius: widget.borderRadius ?? const BorderRadius.all(Radius.circular(5.0)),
            highlightShape: BoxShape.rectangle,
            splashColor: widget.endColor ?? Theme.of(context).primaryColor,
            containedInkWell: true,
            onTap: widget.onPressed,
            child: _buildChild(),
          ),
        ),
      ),
    );
  }

  Widget _buildChild() {

    if (widget.size != null) {
      return SizedBox.fromSize(
        size: widget.size,
        child: Center(child: enabled ? widget.text : Text(widget.text.data ?? '', style: widget.text.style?.copyWith(color: AppColors.nearlyBlack))),
      );
    } else {
      return enabled ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Center(child: widget.text),
      ) : Text(widget.text.data ?? '', style: widget.text.style?.copyWith(color: AppColors.nearlyBlack));
    }
  }

  List<BoxShadow> getBoxShadow() {
    if (enabled) {
      return [
        BoxShadow(
          color: widget.endColor?.withOpacity(.3) ?? Theme.of(context).primaryColor.withOpacity(.2),
          offset: const Offset(0, 8),
          blurRadius: 10,
          spreadRadius: 0.0,
        )
      ];
    } else {
      return [
        BoxShadow(
          color: widget.endColor?.withOpacity(.3) ?? Theme.of(context).primaryColor.withOpacity(.2),
        )
      ];
    }
  }

  bool get enabled => widget.onPressed != null;

}
