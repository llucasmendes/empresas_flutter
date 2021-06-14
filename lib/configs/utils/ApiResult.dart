abstract class ApiResult {
  late String message;
  late int statusCode;

  late Map<String, dynamic> data;
}

class Success implements ApiResult {
  late int statusCode;
  late Map<String, dynamic> data;
  late Map<String, dynamic> responseHeaders;
  late List dataList;
  late String message;
  Success({
    required this.statusCode,
    required this.data,
    required this.dataList,
    required this.responseHeaders,
  });
}

class Failure implements ApiResult {
  int statusCode;
  String message;
  Map<String, dynamic> data;

  Failure({
    required this.statusCode,
    required this.message,
    required this.data,
  });
}

class ApiError implements ApiResult {
  int statusCode;
  String message;
  Map<String, dynamic> data;

  ApiError({
    required this.statusCode,
    required this.message,
    required this.data,
  });
}

class NoInternet implements ApiResult {
  int statusCode;
  String message;
  Map<String, dynamic> data;

  NoInternet({
    required this.statusCode,
    required this.message,
    required this.data,
  });
}
