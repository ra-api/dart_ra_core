import 'package:mab/mab.dart';

import '../../implements/proxy_method.dart';
import 'methods/methods.dart';

/// Демо пакет, содержит один метод
/// - [ReportMethod] наследованный от [ProxyMethod]
/// - [CartSaveMethod] и [CartSaveMethodLegacy] имеют одинаковое название
/// но разный ответ, для демонстарции этой фичи
final class CartPackage extends Package {
  const CartPackage();

  @override
  String get name => 'cart';

  @override
  List<Method> get methods {
    return [
      CartSaveMethod(),
      ReportMethod(),
      CartSaveMethodLegacy(),
    ];
  }

  @override
  List<PackageParameter> get params {
    return [
      PackageHeaderParameter(
        id: 'auth',
        dataType: BoolDataType(),
        initial: true,
        constraints: [
          MethodConstraint<CartSaveMethodLegacy>.allow(),
        ],
      ),
    ];
  }
}

final class SubPackage extends Package {
  final String path;
  final Package package;

  const SubPackage({required this.path, required this.package});
  @override
  List<Method<ResponseContentType<Object>, Object>> get methods {
    return package.methods;
  }

  @override
  String get name => '$path/${package.name}';
}
