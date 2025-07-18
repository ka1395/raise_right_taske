import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Column(
        children: [
          Column(
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/image 1.png",
                    width: 16.943334579467773,
                    height: 16.943334579467773,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "BTC",
                    style: TextStyle(
                      fontSize: 10.608001708984375,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "54,382.64",
                    style: TextStyle(
                      fontSize: 6.482667446136475,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "5",
                style: TextStyle(
                  fontSize: 8.84000015258789,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "271,913.2",
                style: TextStyle(
                  fontSize: 6.482667446136475,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 2.0064849853515625,
                    height: 2.006484031677246,
                  ),
                  Container(
                    width: 2.0064849853515625,
                    height: 2.006484031677246,
                  ),
                ],
              ),
              Text(
                "15.3%",
                style: TextStyle(
                  fontSize: 3.4396891593933105,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
