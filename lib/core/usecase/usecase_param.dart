abstract class UseCaseParam<T, V> {
  Future<T> call(V param);
}

class NoParam {}
