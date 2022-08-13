import 'package:flutter/material.dart';
import 'package:github_commons/module/domain/entities/github_profile_entity.dart';

import '../theme/github_theme.dart';

class GithubProfileWidget extends StatefulWidget {
  final GithubProfileEntity profile;
  final int totalRepositories;
  const GithubProfileWidget({
    Key? key,
    required this.profile,
    required this.totalRepositories,
  }) : super(key: key);

  @override
  State<GithubProfileWidget> createState() => _GithubProfileWidgetState();
}

class _GithubProfileWidgetState extends State<GithubProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.profile.avatarUrl),
                radius: 70,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Text(
                    widget.profile.name,
                    style: const TextStyle(
                      fontFamily: GithubTheme.fontFamilyName,
                      package: GithubTheme.themeName,
                      color: GithubTheme.secondColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "@${widget.profile.username}",
                    style: const TextStyle(
                      fontFamily: GithubTheme.fontFamilyName,
                      package: GithubTheme.themeName,
                      color: GithubTheme.secondColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: GithubTheme.secondColor.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStats(
                        data: widget.profile.following, title: "Following"),
                    _buildStats(
                        data: widget.profile.followers, title: "Followers"),
                    _buildStats(
                        data: widget.totalRepositories, title: "Repositories"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildStats({required int data, required String title}) {
    return Column(
      children: [
        Text(
          data.toString(),
          style: const TextStyle(
            fontFamily: GithubTheme.fontFamilyName,
            package: GithubTheme.themeName,
            color: GithubTheme.secondColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(
            fontFamily: GithubTheme.fontFamilyName,
            package: GithubTheme.themeName,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
