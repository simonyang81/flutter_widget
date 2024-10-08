import '../routes/routes.dart';

/// FileName widget_list
/// 
/// @Author 杨雪松
/// @Email simonyang81@gmail.com
/// @Date 2023/5/12 17:46
///
/// @Description
///
///

class WidgetList {

  final String title;
  final String path;

  WidgetList(this.title, this.path);

  static List<WidgetList> getAllWidgets() {
    List<WidgetList> list = [];
    list.add(WidgetList("渐变按钮 - 自定义child", Routes.linearGradientButtonExample));
    list.add(WidgetList("渐变按钮 - text child", Routes.textLinearGradientButtonExample));
    list.add(WidgetList("点击效果的按钮", Routes.realisticButtonExample));
    list.add(WidgetList("按钮组", Routes.textButtonPanelExample));
    list.add(WidgetList('展开更多', Routes.expandableGroupExample));
    list.add(WidgetList('蓝牙扫描动画', Routes.bluetoothScanningExample));
    list.add(WidgetList('渐变分割线', Routes.dividerExample));
    list.add(WidgetList('背景', Routes.assetBackgroundExample));
    list.add(WidgetList('toast example', Routes.toastExample));
    list.add(WidgetList('分组ListView', Routes.groupedListViewExample));

    list.add(WidgetList('输入框', Routes.inputExample));
    list.add(WidgetList('EasyLoading', Routes.loadingExample));

    list.add(WidgetList('饼状图', Routes.pieChartExample));
    list.add(WidgetList('柱状图', Routes.barChartExample));

    list.add(WidgetList('显示Excel文件', Routes.excelFileExample));

    list.add(WidgetList('iOS弹出菜单', Routes.actionSheet));

    return list;
  }

}