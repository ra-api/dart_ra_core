import 'package:meta/meta.dart';

import 'method_decl.dart';

/// Класс контекст для метода, служит, для извлечения значения параметра
/// по имени и приведения извлеченного значения до [T]
@immutable
final class MethodContext {
  final Map<String, Object> _context;
  final List<MethodDecl> methods;
  final MethodDecl current;
  final bool verbose;

  const MethodContext(
    this._context, {
    required this.current,
    required this.methods,
    required this.verbose,
  });

  value<T>(String id) {
    final val = _context[id];

    return val as T;
  }
}
