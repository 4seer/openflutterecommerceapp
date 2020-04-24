
abstract class BaseUseCase<TResult, TParams> {
  Future<TResult> execute(TParams params);
}

class Failure {
  final dynamic error;

  Failure(this.error);

  T cast<T>() {
    if (error is T) {
      return(error);
    }
    return null;
  }
}