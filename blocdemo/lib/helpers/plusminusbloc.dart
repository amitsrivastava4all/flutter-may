import 'dart:async';

import 'package:bloccode/helpers/transformercalc.dart';

class PlusMinusBloc {
  StreamController<int> _streamController = StreamController<int>();
  Sink<int> get inputSink => _streamController.sink;
  //Stream get outputStream => _streamController.stream;
  Stream get outputStream => _streamController.stream.transform(plus);
  addInSink(int data) {
    data++;
    inputSink.add(data);
  }

  subtractInSink(int data) {
    data--;
    inputSink.add(data);
  }

  @override
  void dispose() {
    _streamController.close();
  }
}
