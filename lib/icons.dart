import 'package:flutter/material.dart';

class StarsIcons {
  static Widget yellowStar = const Icon(
    Icons.star,
    color: Colors.amber,
    size: 18,
  );

  static Widget orangeStar = const Icon(
    Icons.star,
    color: Colors.orange,
    size: 18,
  );

  static Widget pinkStar = const Icon(
    Icons.star,
    color: Colors.pink,
    size: 18,
  );

  static Widget purpleStar = const Icon(
    Icons.star,
    color: Colors.purple,
    size: 18,
  );
  static Widget blueStar = const Icon(
    Icons.star,
    color: Colors.blue,
    size: 18,
  );
  static Widget pinkReport = Stack(
    children: [
      Positioned.fill(
        child: Container(
          margin: const EdgeInsets.all(5),
          color: Colors.black, // Color
        ),
      ),
      const Icon(
        Icons.report,
        color: Colors.pink,
        size: 18,
      ),
    ],
  );
  static Widget yellowReport = Stack(
    children: [
      Positioned.fill(
        child: Container(
          margin: const EdgeInsets.all(5),
          color: Colors.black, // Color
        ),
      ),
      const Icon(
        Icons.report,
        color: Colors.amber,
        size: 18,
      ),
    ],
  );
  static Widget check = Stack(
    children: [
      Positioned.fill(
        child: Container(
          margin: const EdgeInsets.all(3),
          color: Colors.black, // Color
        ),
      ),
      const Icon(
        Icons.check_box,
        color: Colors.green,
        size: 18,
      ),
    ],
  );
}
