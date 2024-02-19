import 'package:mab/mab.dart';
import 'package:mab/src/registry.dart';
import 'package:meta/meta.dart';

import 'parameter.dart';

/// Информация о методе, используется в core.spec но планируется,
/// что в том или ином виде будет добавлено в [MethodContext]
@immutable
final class MethodDecl {
  final RegistryItem _registryItem;

  const MethodDecl(this._registryItem);

  /// Заглушка
  String get httpMethod => 'GET';

  String get package => _registryItem.package.name;
  String get name => _registryItem.method.name;
  String get summary {
    return _registryItem.method.summary ?? 'Method $package.$name';
  }

  List<Parameter> get parameters {
    return _registryItem.method.params;
  }

  Map<String, dynamic> export() {
    final res = <String, dynamic>{
      'method': httpMethod,
      'package': package,
      'name': name,
      'summary': summary,
      'version': _registryItem.version,
      'contentType': _registryItem.method.contentType.mimeType,
    };

    if (_registryItem.method.params.isNotEmpty) {
      final params = parameters.map(
        (e) {
          return {
            'name': e.id,
            'summary': e.summary ?? 'Parameter "${e.id}"',
            'source': _source(e),
            'required': e.isRequired,
          };
        },
      ).toList(growable: false);
      res['params'] = params;
    }

    return res;
  }

  String _source(Parameter param) {
    if (param is MethodParameter) {
      return param.source.source;
    }

    throw UnimplementedError();
  }
}
