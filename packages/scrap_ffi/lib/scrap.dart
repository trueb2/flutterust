import 'dart:async';
import 'dart:ffi';
import 'package:ffi/ffi.dart';

import 'ffi.dart' as native;

import 'dart:isolate';

class Scrap {
  static setup() {
    native.store_dart_post_cobject(NativeApi.postCObject);
    print("Scrap Setup Done");
  }

  Future<String> loadPage(String url) async {
    var urlPointer = url.toNativeUtf8();
    var receivePort = ReceivePort();
    final sendPort = receivePort.sendPort;
    final res = native.load_page(
      sendPort.nativePort,
      urlPointer,
    );
    if (res != 1) {
      _throwError();
    }
    String response = await receivePort.first;
    receivePort.close();
    return response;
  }

  void _throwError() {
    final length = native.last_error_length();
    final Pointer<Utf8> message = calloc.allocate(length);
    native.error_message_utf8(message, length);
    final error = message.toDartString();
    print(error);
    throw error;
  }
}
