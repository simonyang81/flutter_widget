import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// FileName ic_expandable_group
///
/// @Author 杨雪松
/// @Email simonyang81@gmail.com
/// @Date 2023/5/25 10:03
///
/// @Description, 展开更多组件
///
///

class ICExpandableGroup extends StatefulWidget {

  final Text title;
  final List<Widget> children;
  final bool initExpanded;
  final TextStyle? arrowTextStyle;
  final String? arrowUpText;
  final String? arrowDownText;

  const ICExpandableGroup({super.key,
    required this.title,
    this.children = const <Widget>[],
    this.initExpanded = false,
    this.arrowTextStyle,
    this.arrowUpText,
    this.arrowDownText,
  });

  @override
  State<ICExpandableGroup> createState() => _ICExpandableGroupState();
}

class _ICExpandableGroupState extends State<ICExpandableGroup> with SingleTickerProviderStateMixin {

  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween = Tween<double>(begin: 0.0, end: 0.5);

  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;
  late Widget _arrowIcon;

  bool _isExpanded = false;
  late Color iconColor;

  @override
  void initState() {
    super.initState();

    _isExpanded = widget.initExpanded;

    _controller = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);

    _heightFactor = _controller.drive(_easeInTween);
    if (_isExpanded) {
      _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    } else {
      _iconTurns = _controller.drive(Tween<double>(begin: 0.5, end: 0.0).chain(_easeInTween));
    }

    if (_isExpanded) {
      _controller.value = 1.0;
    }

    // 取Text中的style中的颜色
    iconColor = widget.title.style?.color ?? Theme.of(context).primaryColor;

    if (_isExpanded) {
      _arrowIcon = Icon(CupertinoIcons.chevron_down, color: iconColor, size: 18,);
    } else {
      _arrowIcon = Icon(CupertinoIcons.chevron_up, color: iconColor, size: 18,);
    }

  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildHeader,
      child: closed ? null : Column(children: widget.children),
    );
  }

  Widget _buildHeader(BuildContext context, Widget? child) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 14, bottom: 14),
              child: widget.title,
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.black12,
                borderRadius: BorderRadius.circular(8.0),
                onTap: () {
                  _handleTap();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                  child: Row(
                    children: [
                      Text(_isExpanded == true ? widget.arrowUpText ?? '收起' : widget.arrowDownText ?? '展开',
                        style: widget.arrowTextStyle ?? TextStyle(color: iconColor, fontSize: 14),),
                      const SizedBox(width: 2),
                      RotationTransition(
                        turns: _iconTurns,
                        child: _arrowIcon,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),

        ClipRect(
          child: Align(
            heightFactor: _heightFactor.value,
            child: child,
          ),
        ),
      ],
    );
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}
