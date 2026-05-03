sealed class ApiReuslt<T> {
  const ApiReuslt._();
}

class Success<T> extends ApiReuslt<T> {
  final T data;
  const Success(this.data) : super._();
}

class Failure<T> extends ApiReuslt<T> {
  final String error;
  const Failure(this.error) : super._();
}