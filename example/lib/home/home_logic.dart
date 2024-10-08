import 'package:get/get.dart';

import 'widget_list.dart';

class HomeLogic extends GetxController {

  late List<WidgetList> widgetList;

  @override
  void onInit() {
    super.onInit();
    widgetList = WidgetList.getAllWidgets();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
