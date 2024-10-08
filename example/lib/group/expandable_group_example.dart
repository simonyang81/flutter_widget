/// FileName expandable_group_example
/// 
/// @Author 杨雪松
/// @Email simonyang81@gmail.com
/// @Date 2023/5/25 10:25
///
/// @Description
///
///

import 'package:flutter/material.dart';
import 'package:icheer_widget/icheer_widget.dart';

class ExpandableGroupExample extends StatelessWidget {
  const ExpandableGroupExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpandableGroupExample'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: CustomBorder(
          backgroundColor: Colors.grey,
          border: Border.all(color: Colors.transparent, width: 1),
          child: const ICExpandableGroup(
            initExpanded: false,
            title: Text('更多',
              style: TextStyle(fontSize: 16, color: Color(0xFF000000),),
            ),
            arrowTextStyle: TextStyle(fontSize: 14, color: Colors.black,),
            children: [
              Text('1'),
              Text('2'),
              Text('3'),
              Text('4'),
              Text('5'),
              Text('6'),
              Text('7'),
              Text('8'),
              Text('9'),
              Text('10'),
              Text('11'),
              Text('12'),
              Text('13'),
              Text('14'),
              Text('15'),
              Text('16'),
              Text('17'),
              Text('18'),
              Text('19'),
              Text('20'),
            ],
          ),
        ),
      )
    );
  }
}
