/// Copyright openuse.io © 2022
/// FileName pages
///
/// @Author simonyang81@gmail.com
/// @Date 2022/8/18 16:46
///
/// @Description
///
///

import 'package:example/background/asset_background_example.dart';
import 'package:example/button/linear_gradient_button_example.dart';
import 'package:example/button/realistic_button_example.dart';
import 'package:example/button/text_button_panel_example.dart';
import 'package:example/button/text_linear_gradient_button_example.dart';
import 'package:example/chart/pie_chart_example.dart';
import 'package:example/divider/divider_example.dart';
import 'package:example/excel_file/excel_file_example.dart';
import 'package:example/group/grouped_list_view_example.dart';
import 'package:example/home/home_view.dart';
import 'package:example/input/ic_input_example.dart';
import 'package:example/sheet/action_sheet_example.dart';
import 'package:example/toast/toast_example.dart';
import 'package:get/get.dart';

import '../animations/bluetooth_scanning_example.dart';
import '../chart/bar_chart_example.dart';
import '../group/expandable_group_example.dart';
import '../loading/easy_loading_example.dart';
import 'routes.dart';

class Pages {

  static final routes = [

    GetPage(
        name: Routes.home,
        page: () => HomePage(),
        transition: Transition.rightToLeft),

    GetPage(
      name: Routes.linearGradientButtonExample,
      page: () => const LinearGradientButtonExample(),
      transition: Transition.rightToLeft),

    GetPage(
      name: Routes.textLinearGradientButtonExample,
      page: () => const TextLinearGradientButtonExample(),
      transition: Transition.rightToLeft
    ),

    GetPage(
      name: Routes.textButtonPanelExample,
      page: () => const TextButtonPanelExample(),
      transition: Transition.rightToLeft
    ),

    GetPage(
      name: Routes.expandableGroupExample,
      page: () => const ExpandableGroupExample(),
      transition: Transition.rightToLeft),

    GetPage(
      name: Routes.bluetoothScanningExample,
      page: () => const BluetoothScanningExample(),
      transition: Transition.rightToLeft),

    GetPage(
        name: Routes.dividerExample,
        page: () => const DividerExample(),
        transition: Transition.rightToLeft),

    GetPage(name: Routes.assetBackgroundExample,
      page: () => const AssetBackgroundExample(), transition: Transition.rightToLeft),

    GetPage(name: Routes.realisticButtonExample,
        page: () => const RealisticButtonExample(), transition: Transition.rightToLeft),

    GetPage(name: Routes.toastExample,
        page: () => const ToastExample(), transition: Transition.rightToLeft),

    GetPage(name: Routes.groupedListViewExample,
        page: () => const GroupedListViewExample(), transition: Transition.rightToLeft),

    GetPage(name: Routes.inputExample,
        page: () => const InputExample(), transition: Transition.rightToLeft),

    GetPage(name: Routes.loadingExample, page: () => const EasyListViewExample(), transition: Transition.rightToLeft),

    GetPage(name: Routes.pieChartExample, page: () => const PieChartExample(), transition: Transition.rightToLeft),
    GetPage(name: Routes.barChartExample, page: () => BarChartExample(), transition: Transition.rightToLeft),
    GetPage(name: Routes.excelFileExample, page: () => const ExcelFileExample(), transition: Transition.rightToLeft),

    GetPage(name: Routes.actionSheet, page: () => const ActionSheetExample(), transition: Transition.rightToLeft),

  ];


}