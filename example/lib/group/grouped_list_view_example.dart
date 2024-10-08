/// FileName grouped_list_view_example
/// 
/// @Author 杨雪松
/// @Email simonyang81@gmail.com
/// @Date 2023/6/1 10:48
///
/// @Description
///
///

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icheer_widget/icheer_widget.dart';

class GroupedListViewExample extends StatelessWidget {
  const GroupedListViewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GroupedListView Example'),
      ),
      body: Container(
        color: Colors.red,
        child: Theme(
          data: Theme.of(context).copyWith(cardColor: Colors.red),
          child: ICGroupedListView(
            groupList: [
              ('Group A', [GroupItem(key: 'key1', content: 'Item 1'), GroupItem(key: 'key2', content: 'Item 2')]),
              ('Group B', [GroupItem(key: 'key1', content: 'Item 1'), GroupItem(key: 'key2', content: 'Item 2')]),
              ('Group C', [GroupItem(key: 'key5', content: '卡号: 12345678901234567891234567890123456789\n密码: 123456'), ]),
            ],
            onTrailingIconPressed: (groupKey, itemIndex) {
              debugPrint('Pressed ICGroupedListView, groupKey: $groupKey; itemIndex: $itemIndex');
            },
            trailingIcon: CupertinoIcons.delete,
            groupColor: Colors.blue,
            itemColor: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}
