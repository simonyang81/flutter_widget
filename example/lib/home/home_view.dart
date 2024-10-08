import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.put(HomeLogic());

  HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: logic.widgetList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Center(child: Text(logic.widgetList[index].title)),
          onTap: () {
            Get.toNamed(logic.widgetList[index].path);
          },
        );
      },
    );

  }

}
