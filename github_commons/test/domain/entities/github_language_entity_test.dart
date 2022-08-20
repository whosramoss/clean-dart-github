import 'package:flutter_test/flutter_test.dart';
import 'package:github_commons/module/domain/entities/github_language_entity.dart';

void main() {
  const name = 'Dart';
  const icon =
      'https://raw.githubusercontent.com/devicons/devicon/master/icons/dart/dart-original.svg';
  const average = '50%';
  const total = 25;
  group('[GithubLanguageEntity]', () {
    test('New instance with new parameters', () {
      const entity = GithubLanguageEntity(
          name: name, icon: icon, average: average, total: total);

      expect(entity, isA<GithubLanguageEntity>());
      expect(entity.name, equals(name));
      expect(entity.icon, equals(icon));
      expect(entity.average, equals(average));
      expect(entity.total, equals(total));
    });

    test('New instance with copied parameters', () {
      const entity =
          GithubLanguageEntity(name: '', icon: '', average: '', total: 0);

      final newEntity = entity.copyWith(
          name: name, icon: icon, average: average, total: total);

      expect(newEntity, isA<GithubLanguageEntity>());
      expect(newEntity.name, equals(name));
      expect(newEntity.icon, equals(icon));
      expect(newEntity.average, equals(average));
      expect(newEntity.total, equals(total));
    });
  });
}
