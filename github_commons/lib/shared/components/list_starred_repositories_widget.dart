import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_github_dashboard/app/modules/home/presenter/components/repository_widget.dart';
import 'package:flutter_github_dashboard/app/modules/home/presenter/components/title_widget.dart';

import '../../../../model/core/mix.dart';

class ListStarredRepositoriesWidget extends StatelessWidget {
  const ListStarredRepositoriesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Mix> mixes = [
      Mix("Chill Vibes", '+50', 'images/pic8.jpg'),
      Mix("Summer Vibes", '+100', 'images/pic2.jpeg'),
      Mix("Night Vibes", '+150', 'images/pic7.jpeg'),
      Mix("Evening Vibes", '+50', 'images/pic5.jpeg'),
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 50.0, right: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleWidget(text: "Starred Repositories"),
          const SizedBox(height: 30),
          ListView.builder(
            physics: const ScrollPhysics(),
            itemCount: mixes.length,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              Mix mix = mixes[index];
              double distance = 16.0;
              double _top = index == 0 ? 0.0 : distance;

              return Padding(
                padding: EdgeInsets.only(top: _top, bottom: distance),
                child: const RepositoryWidget(
                  title: 'teste teste teste teste teste teste teste teste',
                  description: '',
                  language: 'dart',
                  createAt: '9',
                  isStarred: true,
                  owner: 'gabriel',
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
