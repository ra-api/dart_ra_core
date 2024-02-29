import 'package:mab/mab.dart';
import 'package:meta/meta.dart';

@immutable
final class FixtureMethod extends Method {
  final String? fakeName;
  final List<MethodParameter>? fakeParams;
  final ResponseContentType? fakeContentType;

  const FixtureMethod({
    this.fakeName,
    this.fakeContentType,
    this.fakeParams,
  });
  @override
  ResponseContentType get contentType => _fake(fakeContentType);

  @override
  Future<MethodResponse> handle(MethodContext ctx) {
    throw UnimplementedError();
  }

  @override
  String get name => _fake(fakeName);

  @override
  List<MethodParameter> get params => _fake(fakeParams);

  T _fake<T>(T? value) => value ?? (throw UnimplementedError());
}