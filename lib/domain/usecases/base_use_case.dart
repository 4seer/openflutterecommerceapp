import 'package:dartz/dartz.dart';

abstract class BaseUseCase<TResult, TParams> {
  Future<Either<Failure, TResult>> execute(TParams params);
}

class Failure {
  final dynamic error;

  Failure(this.error);

  T cast<T>() {
    if (error is T) {
      treturn(error);
    }
    return null;
  }
}
