import 'package:github_commons/main.dart';

import 'pages/github_register_page.dart';
import 'pages/github_profile_page.dart';
import 'stores/github_triple_store.dart';

class GithubTripleModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => Dio()),
    Bind.lazySingleton<IGithubDatasource>((i) => GithubDatasource(i())),
    Bind.lazySingleton<IGithubRepository>((i) => GithubRepository(i())),
    Bind.lazySingleton<IGetRepositories>((i) => GetRepositories(i())),
    Bind.lazySingleton<IGetProfile>((i) => GetProfile(i())),
    Bind.lazySingleton<IGetLanguages>((i) => GetLanguages()),
    Bind.lazySingleton((i) => UrlOpen()),
    Bind.lazySingleton((i) => GithubTripleStore(i(), i(), i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      transition: TransitionType.noTransition,
      child: (_, args) => const GithubRegisterPage(),
    ),
    ChildRoute(
      GithubRoutes.profile,
      transition: TransitionType.fadeIn,
      child: (_, args) => const GithubProfilePage(),
    ),
  ];
}
