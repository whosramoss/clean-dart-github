import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:github_commons/main.dart';
import 'package:github_commons/module/infra/models/github_profile_model.dart';
import 'package:github_commons/module/infra/models/github_repository_model.dart';
import 'package:github_commons/shared/utils/github_data_json.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'github_datasource_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  final dio = MockDio();

  late IGithubDatasource datasource;

  setUpAll(() {
    datasource = GithubDatasource(dio);
  });

  group("[GithubDatasource]", () {
    test('All instances injected', () {
      expect(dio, isA<MockDio>());
      expect(datasource, isA<GithubDatasource>());
    });

    test('[FindProfile] Return a GithubProfileModel', () async {
      const username = 'whosramoss';
      when(dio.get(any)).thenAnswer((_) async {
        return Response(
          data: jsonDecode(GithubDataTest.mockprofile),
          requestOptions: RequestOptions(path: ''),
        );
      });

      var result = await datasource.findProfile(username);

      expect(result, isNotNull);
      expect(result, isA<GithubProfileModel>());
    });

    test('[FindRepositories] Return a List<GithubRepositoryModel>', () async {
      const username = 'whosramoss';
      when(dio.get(any)).thenAnswer((_) async {
        return Response(
          data: jsonDecode(GithubDataTest.mockrepositories),
          requestOptions: RequestOptions(path: ''),
        );
      });

      var result = await datasource.findRepositories(username);

      expect(result, isNotNull);
      expect(result, isA<List<GithubRepositoryModel>>());
    });
  });
}
