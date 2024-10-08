import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icheer_widget/icheer_widget.dart';

import '../routes/routes.dart';

/// FileName easy_loading_example
/// 
/// @Author 杨雪松
/// @Email simonyang81@gmail.com
/// @Date 2023/7/3 14:23
///
/// @Description
///
///

class EasyListViewExample extends StatefulWidget {
  const EasyListViewExample({super.key});

  @override
  State<EasyListViewExample> createState() => _EasyListViewExampleState();
}

class _EasyListViewExampleState extends State<EasyListViewExample> {

  bool _ignoring = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy Loading Example', style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
          onPressed: () {
            debugPrint('-->> back to home');
            Get.until((route) => route.settings.name == Routes.home);
          },
          // Get.back(result: {
          //   'command': Constants.commandConnectDevice,
          // }),
        ),
        centerTitle: true,
      ),
      body: _buildContent(),
    );

  }

  Widget _buildContent() {
    return IgnorePointer(
      ignoring: _ignoring,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ICTextGradientButton(
              // size: const Size(100, 50),
              onPressed: () {
                debugPrint('按钮 1 pressed');
                EasyLoading.show(status: 'loading...', dismissOnTap: true);
                setState(() {
                  _ignoring = true;
                });
              },
              text: const Text('显示Loading', style: TextStyle(color: Colors.white, fontSize: 16),),
            ),
            const SizedBox(height: 20),
            ICTextGradientButton(
              // size: const Size(100, 50),
              onPressed: () {
                debugPrint('按钮 2 pressed');
              },
              text: const Text('按钮 2', style: TextStyle(color: Colors.white, fontSize: 16),),
            ),
          ],
        ),
      ),
    );
  }

}

