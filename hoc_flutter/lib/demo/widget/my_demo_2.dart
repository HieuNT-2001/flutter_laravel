import 'package:flutter/material.dart';

class MyDemo2 extends StatelessWidget {
  const MyDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[100],
      child: Column(
        children: [
          for (var i = 1; i <= 6; i++)
            Card(
              color: Colors.blue[200],
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(
                              "assets/images/new_york_city.jpg",
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nguyen Van A",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("Ha noi"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Icon(Icons.play_arrow, color: Colors.white, size: 48),
                          SizedBox(width: 10),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 24,
                              ),
                              Text("5"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
