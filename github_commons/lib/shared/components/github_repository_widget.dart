import 'package:flutter/material.dart';
import 'package:github_commons/module/domain/entities/github_repository_entity.dart';
import 'package:github_commons/shared/components/github_item_widget.dart';

class GithubRepositoryWidget extends StatelessWidget {
  final GithubRepositoryEntity repo;
  const GithubRepositoryWidget({
    Key? key,
    required this.repo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GithubItemWidget(
      title: Text(
        repo.name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      subtitle: Text(
        repo.description,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        style: const TextStyle(
          color: Colors.white30,
          fontSize: 14,
        ),
      ),
    );
  }
}
