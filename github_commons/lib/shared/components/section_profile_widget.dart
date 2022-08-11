import 'package:flutter/material.dart';

import 'github_button_widget.dart';
import 'statistic_number_widget.dart';

class SectionProfileWidget extends StatelessWidget {
  const SectionProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/me.jpeg'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Eduardo Hernandez",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Berkeley, California",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  SizedBox(height: 40),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  StatisticNumberWidget(data: '94K', title: 'Following'),
                  SizedBox(width: 40),
                  StatisticNumberWidget(data: '64K', title: 'Followers'),
                  SizedBox(width: 40),
                  StatisticNumberWidget(data: '54', title: 'Public Repos'),
                ],
              ),
              const SizedBox(height: 40),
              const ChangeProfileButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
