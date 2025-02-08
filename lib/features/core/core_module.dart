import 'package:devlearn/core/interface/irequest_service.dart';
import 'package:devlearn/core/service/request_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<IRequestService>(RequestService.new);
  }
}
