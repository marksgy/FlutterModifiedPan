import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class CustomPanGestureRecognizer extends PanGestureRecognizer {
  @override
  void addAllowedPointer(PointerDownEvent event) {
    super.addAllowedPointer(event);
    resolve(GestureDisposition.accepted);
    //get the GestureRecognizer win immediately after invoking onPanDown
  }
}

RawGestureDetector CustomPanGestureDetector(
    {GestureDragDownCallback? onPanDown,
    GestureDragStartCallback? onPanStart,
    GestureDragUpdateCallback? onPanUpdate,
    GestureDragEndCallback? onPanEnd,
    GestureDragCancelCallback? onPanCancel,
    Widget? child}) {
  return RawGestureDetector(
    gestures: {
      CustomPanGestureRecognizer:GestureRecognizerFactoryWithHandlers<CustomPanGestureRecognizer>(() => CustomPanGestureRecognizer(),(detector){
        detector..onDown=onPanDown
        ..onStart=onPanStart
        ..onUpdate=onPanUpdate
        ..onEnd=onPanEnd
        ..onCancel=onPanCancel;
      })
    },
    child: child,
  );
}
