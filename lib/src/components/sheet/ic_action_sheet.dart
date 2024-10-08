import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// FileName ic_action_sheet
///
/// @Author 杨雪松
/// @Email simonyang81@gmail.com
/// @Date 2024/1/9 09:27
///
/// @Description
///
///

class ICActionSheet extends StatelessWidget {

  final Widget? message;
  final Text cancel;
  final List<SheetAction> actions;
  final Color backgroundColor;

  const ICActionSheet({
    super.key,
    this.message,
    required this.cancel,
    required this.actions,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {

    return CupertinoActionSheet(
      actions: _buildActions(context),
      cancelButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        child: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop('cancel');
          },
          child: cancel,
        ),
      ),

    );
  }

  List<Widget> _buildActions(BuildContext context) {

    List<Widget> widgets = [];
    if (message != null) {
      widgets.add(Container(color: backgroundColor, padding: const EdgeInsets.symmetric(vertical: 20),
      child: message!));
    }

    widgets.addAll(actions.map((action) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: action.splashColor,
          onTap: () => Navigator.of(context).pop(action.value),
          child: Container(
            // color: backgroundColor,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: action.text,
          ),
        ),
      );
    }));

    return widgets;

  }
}

class SheetAction {
  final String value;
  final Color? splashColor;
  final Text text;

  const SheetAction({
    required this.value,
    this.splashColor,
    required this.text
  });
}


