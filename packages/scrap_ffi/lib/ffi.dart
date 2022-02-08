/// bindings for `libscrap`

import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart' as ffi;

// ignore_for_file: unused_import, camel_case_types, non_constant_identifier_names
final DynamicLibrary _dl = _open();
/// Reference to the Dynamic Library, it should be only used for low-level access
final DynamicLibrary dl = _dl;
DynamicLibrary _open() {
  if (Platform.isAndroid) return DynamicLibrary.open('libscrap_ffi.so');
  if (Platform.isIOS) return DynamicLibrary.executable();
  throw UnsupportedError('This platform is not supported.');
}

/// C function `load_page`.
int load_page(
  int port,
  Pointer<ffi.Utf8> url,
) {
  return _load_page(port, url);
}
final _load_page_Dart _load_page = _dl.lookupFunction<_load_page_C, _load_page_Dart>('load_page');
typedef _load_page_C = Int32 Function(
  Int64 port,
  Pointer<ffi.Utf8> url,
);
typedef _load_page_Dart = int Function(
  int port,
  Pointer<ffi.Utf8> url,
);

/// C function `scrap_dummy_bind_symbol`.
int scrap_dummy_bind_symbol() {
  return _scrap_dummy_bind_symbol();
}
final _scrap_dummy_bind_symbol_Dart _scrap_dummy_bind_symbol = _dl.lookupFunction<_scrap_dummy_bind_symbol_C, _scrap_dummy_bind_symbol_Dart>('scrap_dummy_bind_symbol');
typedef _scrap_dummy_bind_symbol_C = Int32 Function();
typedef _scrap_dummy_bind_symbol_Dart = int Function();

/// Binding to `allo-isolate` crate
void store_dart_post_cobject(
  Pointer<NativeFunction<Int8 Function(Int64, Pointer<Dart_CObject>)>> ptr,
) {
  _store_dart_post_cobject(ptr);
}
final _store_dart_post_cobject_Dart _store_dart_post_cobject = _dl.lookupFunction<_store_dart_post_cobject_C, _store_dart_post_cobject_Dart>('store_dart_post_cobject');
typedef _store_dart_post_cobject_C = Void Function(
  Pointer<NativeFunction<Int8 Function(Int64, Pointer<Dart_CObject>)>> ptr,
);
typedef _store_dart_post_cobject_Dart = void Function(
  Pointer<NativeFunction<Int8 Function(Int64, Pointer<Dart_CObject>)>> ptr,
);
