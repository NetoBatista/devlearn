import 'package:devlearn/core/model/learn_model.dart';
import 'package:devlearn/core/tool/result.dart';

abstract class ILearnService {
  Future<Result<List<LearnModel>, String>> get();
}
