/// FileName ic_realistic_circular_button
/// 
/// @Author 杨雪松
/// @Email simonyang81@gmail.com
/// @Date 2023/5/30 14:09
///
/// @Description
///
///

import 'package:flutter/material.dart';

class ICRealisticCircularButton extends StatefulWidget {
  final Widget? child;
  final VoidCallback onPressed;
  final String backgroundImage;
  final String? overlayImage;
  final Widget? overlay;
  final double size;
  final Color? splashColor;
  final Text? description;

  const ICRealisticCircularButton({super.key,
    this.child,
    this.splashColor,
    required this.onPressed,
    required this.backgroundImage,
    this.overlayImage,
    this.overlay,
    required this.size,
    this.description,
  });

  @override
  State<ICRealisticCircularButton> createState() => _ICRealisticCircularButtonState();
}

class _ICRealisticCircularButtonState extends State<ICRealisticCircularButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 100),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        );
      },
      child: Material(
        type: MaterialType.transparency,
        borderRadius: BorderRadius.circular(widget.size),
        child: InkWell(
          borderRadius: BorderRadius.circular(widget.size),
          splashColor: widget.splashColor ?? Colors.black,
          onTap: () async {
            widget.onPressed();
            await _controller.forward();
            _controller.reverse();
          },
          child: Container(
            width: widget.size, // 调整按钮的宽度
            height: widget.size, // 调整按钮的高度
            decoration: BoxDecoration(
              shape: BoxShape.circle, // 将按钮形状改为圆形
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 4.0,
                ),
              ],
              image: DecorationImage(
                image: AssetImage(widget.backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildOverlayImg(),
                ..._buildDescription(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOverlayImg() {

    if (widget.overlayImage != null && widget.overlayImage!.isNotEmpty) {
      return Image.asset(widget.overlayImage!,);
    }

    if (widget.overlay != null) {
      return widget.overlay!;
    }

    return const SizedBox();

  }


  List<Widget> _buildDescription() {
    if (widget.description == null
        || widget.description!.data == null
        || widget.description!.data!.isEmpty) {
      return [const SizedBox()];
    }

    return [
      const SizedBox(height: 10,),
      widget.description!,
    ];

  }

}
