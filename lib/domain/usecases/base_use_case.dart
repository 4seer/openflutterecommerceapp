
abstract class BaseUseCase<TResult, TParams> {
  Future<TResult> execute(TParams params);
}

class UseCaseResult {
  final Exception exception;
  final bool result;

  UseCaseResult({
    this.exception,
    this.result
  });

  bool get validResults => exception == null;
}