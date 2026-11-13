sealed class ApiResult<T> {
  const ApiResult();
}

class ApiSuccess<T> extends ApiResult<T> {
  const ApiSuccess(this.data);
  final T data;
}

class ApiError<T> extends ApiResult<T> {
  const ApiError(this.message);
  final String message;
}
