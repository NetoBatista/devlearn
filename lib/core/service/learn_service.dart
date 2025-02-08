import 'package:devlearn/core/interface/ilearn_service.dart';
import 'package:devlearn/core/interface/irequest_service.dart';
import 'package:devlearn/core/model/github_model.dart';
import 'package:devlearn/core/model/learn_model.dart';
import 'package:devlearn/core/tool/result.dart';

class LearnService implements ILearnService {
  final IRequestService _requestService;
  LearnService(this._requestService);

  @override
  Future<Result<List<LearnModel>, String>> get() async {
    try {
      var response = await _requestService.get(
        'https://api.github.com/repos/NetoBatista/qweqwe/contents/content',
      );
      if (response.statusCode != 200) {
        return Failure('Não foi possível buscar o conteúdo');
      }

      var contents = GithubModel.fromJsonList(response.body);
      List<LearnModel> result = [];
      for (var content in contents) {
        var contentLearn = await _requestService.get(content.downloadUrl);
        if (contentLearn.statusCode == 200) {
          result.add(LearnModel.fromJson(contentLearn.body));
        }
      }
      return Success(result);
    } catch (error) {
      return Failure('Não foi possível buscar o conteúdo: $error');
    }
  }
}
