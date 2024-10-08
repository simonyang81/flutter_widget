/// FileName ic_input_example
/// 
/// @Author 杨雪松
/// @Email simonyang81@gmail.com
/// @Date 2023/6/5 10:30
///
/// @Description
///
///


import 'package:flutter/material.dart';

class InputExample extends StatelessWidget {
  const InputExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildInput(),
      ),
    );
  }

  _buildInput() {
    // 返回一个有四边边框的输入框
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        // focusedBorder: const OutlineInputBorder(
        //   borderSide: BorderSide(
        //     color: OPUColors.app,
        //   ),
        // ),
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          // borderSide: const BorderSide(
          //   color: Colors.grey,
          // ),
          // border: InputBorder.none,
          hintText: '请输入内容',
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

}
