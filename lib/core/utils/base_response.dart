class BaseResponse {
  static T getData<T>(
    dynamic response,
    T Function(Map<String, dynamic> json) bodyBuilder,
  ) {
    return bodyBuilder.call(response['content']);
  }
  static T getDataWithOut<T>(
      dynamic response,
      T Function(Map<String, dynamic> json) bodyBuilder,
      ) {
    return bodyBuilder.call(response);
  }
  static List<T> getDataListNoPage<T>(
      dynamic response,
      T Function(Map<String, dynamic> json) bodyBuilder,
      ) {

    return response['content'].map<T>((e) => bodyBuilder.call(e)).toList();
  }
  static List<T> getDataList<T>(
    dynamic response,
    T Function(Map<String, dynamic> json) bodyBuilder,
  ) {

    return response['content']["items"].map<T>((e) => bodyBuilder.call(e)).toList();
  }
}
