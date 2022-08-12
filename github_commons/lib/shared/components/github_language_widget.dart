import 'package:flutter/material.dart';
import 'package:github_commons/shared/components/github_item_widget.dart';

import '../../module/domain/entities/github_language_entity.dart';

class GithubLanguageWidget extends StatelessWidget {
  final GithubLanguageEntity lang;
  const GithubLanguageWidget({
    Key? key,
    required this.lang,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GithubItemWidget(
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(lang.icon),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  lang.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      '${lang.average}%, used in ${lang.total} projects',
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: const TextStyle(
                        color: Colors.white30,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
