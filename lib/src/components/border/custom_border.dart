import 'package:flutter/material.dart';


class CustomBorder extends StatelessWidget {

  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;

  const CustomBorder({super.key,
    required this.child,
    this.margin,
    this.padding,
    this.border,
    this.borderRadius,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {

    Widget container = Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0x80164A7E),
        border:  border ?? Border.all(color: const Color(0xFF3784D2).withOpacity(0.72), width: 1),
        borderRadius: borderRadius ?? BorderRadius.circular(8),
      ),
      padding: padding,
      margin: margin,
      width: double.infinity,
      child: child,
    );

    return container;
  }

}
