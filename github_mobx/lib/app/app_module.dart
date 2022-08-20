import 'package:github_commons/main.dart';

import 'modules/github/presenter/github_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      Modular.initialRoute,
      transition: TransitionType.noTransition,
      module: GithubModule(),
    ),
  ];
}
