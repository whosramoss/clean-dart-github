import 'package:flutter_test/flutter_test.dart';
import 'package:github_commons/module/domain/entities/github_language_entity.dart';

void main() {
  const mock = GithubLanguageEntity(
    name: 'Dart',
    icon: 'https://raw.githubusercontent.com/devicons/devicon/master/icons/dart/dart-original.svg',
    average: '50%',
    total: 25,
  );

  test('New instance with new parameters', () {
    const entity = mock;

    expect(entity, isA<GithubLanguageEntity>());
    expect(entity, equals(mock));
  });

  test('New instance with copied parameters', () {
    final entity = GithubLanguageEntity.empty.copyWith(total: mock.total);

    expect(entity, isA<GithubLanguageEntity>());
    expect(entity.total, equals(mock.total));
  });
}
