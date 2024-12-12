class DataState<T, V> {
  final T? data;
  final V? error;

  DataState(this.data, this.error);

  bool get isSuccess => error == null;

  bool get isError => error != null;

  factory DataState.success(T data) => DataState(data, null);

  factory DataState.error(V error) => DataState(null, error);

  void fold<R>(R Function(T data) onSuccess, R Function(V error) onError) {
    if (isSuccess) {
      onSuccess(data as T);
    } else {
      onError(error as V);
    }
  }
}
