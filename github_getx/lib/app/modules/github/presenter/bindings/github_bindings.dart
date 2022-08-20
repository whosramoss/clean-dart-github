import 'package:github_commons/main.dart';

import '../../../../shared/utils/exports.dart';
import '../controllers/github_controller.dart';

class GithubBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(Dio());

    // Datasource
    Get.put<IGithubDatasource>(GithubDatasource(Get.find()));

    // Repository
    Get.put<IGithubRepository>(GithubRepository(Get.find()));

    // Usecases
    Get.put<IFindProfile>(FindProfile(Get.find()));
    Get.put<IFindRepositories>(FindRepositories(Get.find()));
    Get.put<IFindLanguages>(FindLanguages());
    Get.put<IUrlOpen>(UrlOpen());

    // Controller
    Get.put<GithubController>(
      GithubController(
        Get.find(),
        Get.find(),
        Get.find(),
        Get.find(),
      ),
    );
  }
}
