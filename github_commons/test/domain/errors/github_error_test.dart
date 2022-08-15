import 'package:flutter_test/flutter_test.dart';
import 'package:github_commons/module/domain/errors/github_errors.dart';

void main() {
  group("[GithubError]", () {
    test('New error with GithubError type', () {
      final error = GithubError(
        exception: ArgumentError('test'),
        errorMessage: 'message',
        statusCode: 400,
      );

      expect(error, isA<GithubError>());
      expect(error.exception, isA<ArgumentError>());
      expect(error.errorMessage, equals('message'));
      expect(error.label, equals('GithubError'));
    });
  });
}
