/// FileName ic_text_button_panel
/// 
/// @Author 杨雪松
/// @Email simonyang81@gmail.com
/// @Date 2023/5/18 15:19
///
/// @Description 主次按钮组成的横向面板，一个主按钮 和 多个次级按钮，所有按钮等分，按钮之间的间距是 10
///              主按钮的里面显示的是文字，背景色渐变，次按钮的里面显示的是文字，背景非渐变
///              按钮最多显示5个，如果超过5个，只显示前5个
///
///

import 'package:flutter/material.dart';
import 'package:icheer_widget/icheer_widget.dart';

class ICTextButtonPanel extends StatefulWidget {

  final List<Text> buttons;                 // 按钮的text child
  final void Function(int)? buttonOnTap;    // 按钮的回调
  final TextStyle? buttonTextStyle;          // 按钮的text style

  final double horizontalPadding;           // 整个按钮面板的水平的padding，默认是 20

  final Size? size;
  final Color? startColor;
  final Color? endColor;

  const ICTextButtonPanel({Key? key,
    required this.buttons,
    this.buttonOnTap,
    this.horizontalPadding = 20,
    this.buttonTextStyle,
    this.startColor,
    this.endColor,
    this.size,
  }) : super(key: key);

  @override
  State<ICTextButtonPanel> createState() => _ICTextButtonPanelState();
}

class _ICTextButtonPanelState extends State<ICTextButtonPanel> {

  final int maxButtonCount = 5;           // 最多显示的按钮个数

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          widget.horizontalPadding, 0, widget.horizontalPadding, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: buildButtons(context),
          ),
        ],
      ),
    );
  }

  List<Widget> buildButtons(BuildContext context) {
    List<Widget> buttons = [];
    for (int i = 0; i < widget.buttons.length && i < maxButtonCount; i++) {
      buttons.add(
        Expanded(
          child: ICTextGradientButton(
            startColor: widget.startColor,
            endColor: widget.endColor,
            onPressed: () {
              if (widget.buttonOnTap != null) {
                widget.buttonOnTap!(i);
              }
            },
            text: Text(widget.buttons[i].data ?? '', style: widget.buttonTextStyle,),
            size: widget.size,
          ),
        ),
      );
      if (i != widget.buttons.length - 1) {
        buttons.add(const SizedBox(width: 10,));
      }
    }
    return buttons;
  }

}
