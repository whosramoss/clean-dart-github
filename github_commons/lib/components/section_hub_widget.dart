import 'package:flutter/material.dart';

import 'list_languages_widget.dart';
import 'list_repositories_widget.dart';
import 'list_starred_repositories_widget.dart';

class SectionHubWidget extends StatelessWidget {
  const SectionHubWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 4,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListRepositoriesWidget(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Flexible(flex: 4, child: ListStarredRepositoriesWidget()),
                Flexible(flex: 6, child: ListLanguagesWidget()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
