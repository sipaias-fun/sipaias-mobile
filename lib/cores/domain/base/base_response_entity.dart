class BaseResponseEntity<Result> {
  Meta? meta;
  Result data;

  BaseResponseEntity({required this.meta, required this.data});
}

class Meta {
  int? code;
  bool? success;
  String? message;

  Meta({this.code, this.success, this.message});

  Meta.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}
