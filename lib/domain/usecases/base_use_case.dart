
abstract class BaseUseCase<TResult, TParams> {
  Future<TResult> execute(TParams params);
}

class UseCaseResult {
  final Exception exception;
  final bool result;

  UseCaseResult({
    required this.exception,
    required this.result
  });

  bool get validResults => exception == null;
}