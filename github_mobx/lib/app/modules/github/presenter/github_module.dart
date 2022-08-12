import 'package:github_commons/main.dart';
import 'package:github_mobx/app/shared/routes.dart';

import 'pages/github_register_page.dart';
import 'pages/github_profile_page.dart';
import 'stores/github_store.dart';

class GithubModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => Dio()),
    Bind.lazySingleton<IDioHttpConnection>((i) => DioHttpConnection(i())),
    Bind.lazySingleton<IGithubDatasource>((i) => GithubDatasource(i())),
    Bind.lazySingleton<IGithubRepository>((i) => GithubRepository(i())),
    Bind.lazySingleton<IFindRepositories>((i) => FindRepositories(i())),
    Bind.lazySingleton<IFindProfile>((i) => FindProfile(i())),
    Bind.lazySingleton<IFindStatsLanguage>((i) => FindStatsLanguage()),
    Bind.lazySingleton<IUrlOpen>((i) => UrlOpen()),
    Bind.lazySingleton((i) => GithubStore(i(), i(), i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      transition: TransitionType.noTransition,
      child: (_, args) => const GithubRegisterPage(),
    ),
    ChildRoute(
      Paths.home,
      transition: TransitionType.noTransition,
      child: (_, args) => const GithubProfilePage(),
    ),
  ];
}
