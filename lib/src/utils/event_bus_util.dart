/// FileName event_bus_util
///
/// @Author simonyang81@gmail.com
/// @Date 2023/4/4 14:41
///
/// @Description
///
///

import 'dart:async';
import 'package:event_bus/event_bus.dart';

abstract class Event {}

class EventBusUtil {
  static EventBus? _eventBus;

  static EventBus getInstance() {
    _eventBus ??= EventBus();
    return _eventBus!;
  }

  static StreamSubscription<T> listen<T extends Event>(
      Function(T event) onData) {
    _eventBus ??= EventBus();
    return _eventBus!.on<T>().listen(onData);
  }

  static void fire<T extends Event>(T e) {
    _eventBus ??= EventBus();
    _eventBus!.fire(e);
  }

}
