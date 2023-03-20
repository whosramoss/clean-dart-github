import 'package:github_commons/main.dart';

import '../controllers/github_controller.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class GithubBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(Dio());

    // Datasource
    Get.put<IGithubDatasource>(GithubDatasource(Get.find()));

    // Repository
    Get.put<IGithubRepository>(GithubRepository(Get.find()));

    // Usecases
    Get.put<IGetProfile>(GetProfile(Get.find()));
    Get.put<IGetRepositories>(GetRepositories(Get.find()));
    Get.put<IGetLanguages>(GetLanguages());
    Get.put(UrlOpen());

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
