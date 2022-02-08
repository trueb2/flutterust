import 'dart:ffi';
import 'package:ffi/ffi.dart';

import 'ffi.dart' as native;

class Runtime {
  static setup() {
    native.store_dart_post_cobject(NativeApi.postCObject);
    native.runtime_setup();
    print("Runtime Setup Done");
  }

  static void throwRuntimeError() {
    final length = native.last_error_length();
    final Pointer<Utf8> message = calloc.allocate(length);
    native.error_message_utf8(message, length);
    final error = message.toDartString();
    print(error);
    throw error;
  }
}
