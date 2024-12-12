sealed class BaseStatus {
  const BaseStatus();
}

class BaseInit extends BaseStatus {
  const BaseInit();
}

class BaseLoading extends BaseStatus {
  const BaseLoading();
}

class BaseEmpty extends BaseStatus {
  const BaseEmpty();
}

class BaseNotAuth extends BaseStatus {
  const BaseNotAuth();
}

class BaseComplete<T> extends BaseStatus {
  final T data;

  const BaseComplete(this.data);
}

class BaseError extends BaseStatus {
  final String errorMessage;

  const BaseError(this.errorMessage);
}
