import 'package:flutter/material.dart';
import 'package:flutter_github_dashboard/app/modules/home/presenter/components/repository_widget.dart';

import '../../../../model/core/video.dart';
import 'title_widget.dart';

class ListRepositoriesWidget extends StatelessWidget {
  const ListRepositoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Video> videos = [
      Video('', 'images/pic6.jpeg', '7:08', 'Discovery', 2),
      Video('The Search for Icelandic Wildlife', 'images/pic3.jpeg', '15:32',
          'Discovery', 7),
      Video('The Definitive Brazil Travel Guide | BuzzFeed', 'images/pic1.jpeg',
          '15:32', 'Discovery', 3),
      Video('I lived in the Caribbean for 60 days.', 'images/pic4.jpeg',
          '15:32', 'Discovery', 5),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: TitleWidget(text: "Repositories (${videos.length}) "),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 200,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 40),
              scrollDirection: Axis.horizontal,
              itemCount: videos.length,
              itemBuilder: (_, index) {
                Video video = videos[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: RepositoryWidget(
                    title: video.title,
                    description: video.title,
                    language: 'dart',
                    createAt: '9',
                    isStarred: false,
                    owner: 'gabriel',
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
