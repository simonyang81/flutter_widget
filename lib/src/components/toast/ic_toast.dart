/// FileName ic_toast
/// 
/// @Author 杨雪松
/// @Email simonyang81@gmail.com
/// @Date 2023/5/31 10:31
///
/// @Description
///
///

import 'dart:math';
import 'package:flutter/material.dart';

class ICToast {
  static const int _defaultTopOffset = 50;

  static const int _defaultBottomOffset = 50;

  static ToastView? preToast;

  static void showInCenter({
    required String text,
    required BuildContext context,
    Duration? duration,
    TextStyle? textStyle,
    Color? background,
    double? radius,
  }) {
    show(
      text,
      context,
      duration: duration,
      gravity: ToastGravity.center,
      textStyle: textStyle,
      background: background,
      radius: radius,
    );
  }

  static void showInBottom({
    required String text,
    required BuildContext context,
    Duration? duration,
    TextStyle? textStyle,
    Color? background,
    double? radius,
  }) {
    show(
      text,
      context,
      duration: duration,
      gravity: ToastGravity.bottom,
      textStyle: textStyle,
      background: background,
      radius: radius,
    );
  }

  static void show(
      String text,
      BuildContext context, {
        Duration? duration,
        Color? background,
        TextStyle? textStyle,
        double? radius,           // Toast 的圆角大小
        double? verticalOffset,   // 距离中心偏移量
        VoidCallback? onDismiss,
        ToastGravity? gravity,    // Toast 显示的位置
      }) {
    final overlayState = Overlay.of(context);

    // 隐藏之前显示的Toast视图
    preToast?._dismiss();
    preToast = null;

    final double finalVerticalOffset = _getVerticalOffset(
      context: context,
      gravity: gravity,
      verticalOffset: verticalOffset,
    );

    final int autoDuration = min(text.length * 0.06 + 0.8, 5.0).ceil();

    final Duration finalDuration = duration ?? Duration(seconds: autoDuration);
    final OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) {
        return ToastWidget(
          widget: ToastChild(
            background: background,
            radius: radius,
            msg: text,
            textStyle: textStyle ?? TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),
            gravity: gravity,
            verticalOffset: finalVerticalOffset,
          ),
        );
      },
    );
    final toastView = ToastView(overlayState: overlayState, overlayEntry: overlayEntry);
    preToast = toastView;
    toastView._show(
      duration: finalDuration,
      onDismiss: onDismiss,
    );
  }

  static double _getVerticalOffset({
    required BuildContext context,
    ToastGravity? gravity,
    double? verticalOffset,
  }) {
    final double defaultOffset;
    switch (gravity) {
      case ToastGravity.bottom:
        final offset = verticalOffset ?? _defaultBottomOffset;
        defaultOffset = MediaQuery.of(context).viewInsets.bottom + offset;
        break;
      case ToastGravity.top:
        final offset = verticalOffset ?? _defaultTopOffset;
        defaultOffset = MediaQuery.of(context).viewInsets.top + offset;
        break;
      case ToastGravity.center:
      default:
        defaultOffset = verticalOffset ?? 0;
    }

    return defaultOffset + (verticalOffset ?? 0);
  }
}

final class ToastView {
  OverlayState overlayState;
  OverlayEntry overlayEntry;
  bool _isVisible = false;

  ToastView({
    required this.overlayState,
    required this.overlayEntry,
  });

  void _show({
    required Duration duration,
    VoidCallback? onDismiss,
  }) async {
    _isVisible = true;
    overlayState.insert(overlayEntry);
    Future.delayed(duration, () {
      _dismiss();
      onDismiss?.call();
    });
  }

  void _dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    overlayEntry.remove();
  }
}

final class ToastChild extends StatelessWidget {
  const ToastChild({
    Key? key,
    required this.msg,
    required this.verticalOffset,
    this.background,
    this.radius,
    this.gravity,
    this.textStyle,
  }) : super(key: key);

  Alignment get alignment {
    switch (gravity) {
      case ToastGravity.bottom:
        return Alignment.bottomCenter;
      case ToastGravity.top:
        return Alignment.topCenter;
      case ToastGravity.center:
      default:
        return Alignment.center;
    }
  }

  EdgeInsets get padding {
    switch (gravity) {
      case ToastGravity.bottom:
        return EdgeInsets.only(bottom: verticalOffset);
      case ToastGravity.top:
      case ToastGravity.center:
      default:
        return EdgeInsets.only(top: verticalOffset);
    }
  }

  final String msg;
  final double verticalOffset;
  final Color? background;
  final double? radius;
  final ToastGravity? gravity;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: padding,
        alignment: alignment,
        width: MediaQuery.of(context).size.width,
        child: Container(
          decoration: BoxDecoration(
            color: background ?? const Color(0xFF222222),
            borderRadius: BorderRadius.circular(radius ?? 4),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
          child: Text('1', style: textStyle, textScaleFactor: textScaleFactor.clamp(1.0, 1.0)),
        ),
      ),
    );
  }
}

final class ToastWidget extends StatelessWidget {
  const ToastWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Material(color: Colors.transparent, child: widget),
    );
  }
}

enum ToastGravity {
  bottom,
  center,
  top,
}

class ICDuration {
  ICDuration._();

  static const Duration short = Duration(seconds: 1);

  static const Duration long = Duration(seconds: 3);
}
