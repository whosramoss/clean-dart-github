import '../../entities/github_repository_entity.dart';
import '../../entities/github_language_entity.dart';

abstract class IGetLanguages {
  List<GithubLanguageEntity> call(List<GithubRepositoryEntity> repositories);
}
