import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icheer_widget/icheer_widget.dart';

class ActionSheetExample extends StatelessWidget {
  const ActionSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Action Sheet Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {

                var result = await showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return const ICActionSheet(
                      backgroundColor: Colors.white30,
                      message: Text('Action Sheet 内容', style: TextStyle(fontSize: 16), textAlign: TextAlign.center,),
                      cancel: Text('取消'),
                      actions: [
                        SheetAction(
                          text: Text('按钮 1', style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
                          value: 'action1',
                          splashColor: Colors.black,
                        ),
                        SheetAction(
                          text: Text('按钮 2', style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
                          value: 'action2',
                          splashColor: Colors.black,
                        ),
                      ],
                    );
                  },
                ).then((value) {
                  debugPrint('-->> result: $value');
                });


              },
              child: const Text('Show Action Sheet'),
            ),
          ],
        ),
      )
    );
  }
}
