import 'package:devlearn/core/model/response_model.dart';

abstract class IRequestService {
  Future<ResponseModel> get(
    String endpoint,
  );
}
