/// Copyright openuse.io © 2022
/// FileName custom_underline_indicator
/// 
/// @Author simonyang81@gmail.com
/// @Date 2022/8/26 00:05
///
/// @Description
///
///

import 'package:flutter/material.dart';

class ICUnderlineTabIndicator extends Decoration {

  final BorderSide borderSide;
  final EdgeInsetsGeometry insets;
  final StrokeCap strokeCap; // 控制器的边角形状
  final double width; // 控制器的宽度

  const ICUnderlineTabIndicator({
    this.borderSide = const BorderSide(width: 2, color: Colors.white),
    this.insets = EdgeInsets.zero,
    this.strokeCap = StrokeCap.square,
    this.width  = 20,
  });


  @override
  Decoration? lerpFrom(Decoration? a, double t) {

    if (a is ICUnderlineTabIndicator) {
      return ICUnderlineTabIndicator(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t)!,
      );
    }

    return super.lerpFrom(a, t);
  }

  @override
  Decoration? lerpTo(Decoration? b, double t) {
    if (b is ICUnderlineTabIndicator) {
      return ICUnderlineTabIndicator(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t)!,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _UnderlinePainter(this, onChanged!);
  }

  @override
  Path getClipPath(Rect rect, TextDirection textDirection) {
    return Path()..addRect(_indicatorRectFor(rect, textDirection));
  }

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);

    // 希望的宽度
    double wantWidth = width;
    // 取中间坐标
    double cw = (indicator.left + indicator.right) / 2;
    // 这里是核心代码
    return Rect.fromLTWH(cw - wantWidth / 2,
        indicator.bottom - borderSide.width, wantWidth, borderSide.width);
  }
}

class _UnderlinePainter extends BoxPainter {
  _UnderlinePainter(this.decoration, VoidCallback onChanged)
      : super(onChanged);

  final ICUnderlineTabIndicator decoration;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    final TextDirection textDirection = configuration.textDirection!;
    final Rect indicator = decoration
        ._indicatorRectFor(rect, textDirection)
        .deflate(decoration.borderSide.width / 2);
    final Paint paint = decoration.borderSide.toPaint()
      ..strokeCap = decoration.strokeCap; // 这里修改控制器边角的形状
    canvas.drawLine(indicator.bottomLeft, indicator.bottomRight, paint);
  }

}