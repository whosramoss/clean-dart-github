import 'package:flutter/material.dart';
import 'package:github_commons/module/domain/entities/github_profile_entity.dart';

class GithubProfileWidget extends StatefulWidget {
  final GithubProfileEntity profile;
  const GithubProfileWidget({
    Key? key,
    required this.profile,
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
            const SizedBox(height: 30),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300, width: 5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(widget.profile.avatarUrl),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.profile.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(height: 10),
            Text(
              widget.profile.username,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStats(
                    data: widget.profile.following.toString(),
                    title: "Following",
                  ),
                  _buildStats(
                    data: widget.profile.followers.toString(),
                    title: "Followers",
                  ),
                  _buildStats(
                    data: widget.profile.publicRepos.toString(),
                    title: "Repositories",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildStats({required String data, required String title}) {
    return Column(
      children: [
        Text(
          data,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
