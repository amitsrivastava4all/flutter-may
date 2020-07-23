import 'dart:async';

final plus = StreamTransformer<int, int>.fromHandlers(
    handleData: (int dataValue, Sink sink) {
  dataValue = dataValue * 5;
  sink.add(dataValue);
});
