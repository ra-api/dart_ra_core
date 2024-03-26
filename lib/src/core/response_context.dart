import 'dart:typed_data';

import 'package:meta/meta.dart';

@immutable
final class ResponseCtx {
  final int statusCode;
  final Uint8List body;
  final Map<String, String> headers;

  const ResponseCtx({
    required this.statusCode,
    required this.body,
    required this.headers,
  });
}
