import 'package:flutter/material.dart';

import 'title_widget.dart';

class ListLanguagesWidget extends StatelessWidget {
  const ListLanguagesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Channel> channels = [
      Channel('Marques Brownlee', "10.2M", '1,027', 'images/you1.jpg'),
      Channel('Jacksfilms', "5.1M", '746', 'images/you2.jpg'),
      Channel('Reso Coder', "58.3K", '107', 'images/you3.jpg'),
      Channel('iJustine', "5.7M", '1,158', 'images/you4.jpg'),
      Channel('Robert Brunhage', "30.7K", '204', 'images/you5.jpg'),
      Channel('Pewdiepie', "101M", '7,309', 'images/you6.png'),
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 50.0, right: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleWidget(text: "Top Languages"),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView.separated(
              physics: const ScrollPhysics(),
              separatorBuilder: (_, i) {
                return Container(
                  height: 1,
                  color: Colors.white.withOpacity(0.08),
                );
              },
              shrinkWrap: true,
              itemCount: channels.length,
              itemBuilder: (context, index) {
                Channel channel = channels[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(channel.logo),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              channel.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            const Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Text(
                                  " • 54% • used in 4 projects",
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  style: TextStyle(
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
