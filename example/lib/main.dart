import 'package:example/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icheer_widget/icheer_widget.dart';

import 'routes/pages.dart';

import 'package:icheer_widget/src/resources/app_resources.dart';

import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      title: 'Icheer Widget Example',
      // theme: ThemeData(colorScheme: AppColors.lightColorScheme),
      // darkTheme: ThemeData(colorScheme: AppColors.darkColorScheme),
      getPages: Pages.routes,
      initialRoute: Routes.home,
      builder: EasyLoading.init(),
      // home: HomePage()
    );

  }
}

