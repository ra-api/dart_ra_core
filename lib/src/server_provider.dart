import 'dart:async';

import 'package:mab/mab.dart';
import 'package:mab/src/request_context.dart';
import 'package:meta/meta.dart';

typedef HandlerCallback = Future<MethodResponse> Function(RequestContext ctx);

@immutable
abstract base class ServerProvider {
  final int port;

  const ServerProvider({required this.port});

  @mustCallSuper
  Future<void> init(HandlerCallback handler);
}
