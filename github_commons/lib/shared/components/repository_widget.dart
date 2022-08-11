import 'package:flutter/material.dart';

class RepositoryWidget extends StatelessWidget {
  final String title;
  final String description;
  final String language;
  final String createAt;
  final bool isStarred;
  final String owner;
  const RepositoryWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.language,
    required this.createAt,
    required this.isStarred,
    required this.owner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 270,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.06),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 0.45,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 15),
                  Visibility(
                    visible: description.isNotEmpty,
                    child: Text(
                      description,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        letterSpacing: 0.45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 20, bottom: 13),
              child: Text(
                isStarred
                    ? '$owner . create at $createAt days ago'
                    : 'create at $createAt days ago',
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
