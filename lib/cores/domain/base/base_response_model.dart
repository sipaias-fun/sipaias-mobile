import 'base_response_entity.dart';

class BaseResponseModel<Result> extends BaseResponseEntity<Result> {
  BaseResponseModel.fromJson({
    required Map<String, dynamic> response,
    required Result Function(Map<String, dynamic> json) onResult,
  }) : super(
          meta: Meta.fromJson(response["meta"] ?? ""),
          data: onResult(response["data"] ?? {}),
        );
}
