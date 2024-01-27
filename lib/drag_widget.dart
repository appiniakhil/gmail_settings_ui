import 'package:flutter/material.dart';

class Star {
  final Color color;

  Star(this.color);
}

class CText extends StatelessWidget {
  final String text;
  final FontWeight weight;

  const CText({super.key, required this.text, this.weight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: weight),
    );
  }
}

class DragAndDropScreen extends StatefulWidget {
  const DragAndDropScreen({super.key});

  @override
  DragAndDropScreenState createState() => DragAndDropScreenState();
}

class DragAndDropScreenState extends State<DragAndDropScreen> {
  List<Star> inUseStars = [
    Star(Colors.yellow[600]!),
  ];
  List<Star> notInUseStars = [
    Star(Colors.orange[600]!),
    Star(Colors.red[600]!),
    Star(Colors.purple[600]!),
    Star(Colors.blue[600]!),
    Star(Colors.green[600]!),
    Star(Colors.red[600]!),
    Star(Colors.orange[600]!),
    Star(Colors.yellow[600]!),
    Star(Colors.green[600]!),
    Star(Colors.blue[600]!),
    Star(Colors.purple[600]!),
  ];

  Widget buildStar(Star star) {
    return Draggable<Star>(
      data: star,
      feedback: Icon(Icons.star, color: star.color.withOpacity(0.7)),
      childWhenDragging: const Icon(Icons.star, color: Colors.transparent),
      child: Icon(Icons.star, color: star.color),
    );
  }

  Widget buildStarList(List<Star> stars) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: stars.map((star) => buildStar(star)).toList(),
    );
  }

  Widget buildDragTargetList(bool isInUse,List<Star> starsList) {

    return DragTarget<Star>(
      onAccept: (star) {
        if (isInUse) {
          if (inUseStars.length <= 10) {
            setState(() {
              inUseStars.add(star);
              notInUseStars.remove(star);
              starsList = inUseStars;
            });
          }
        } else {
          if (notInUseStars.length <= 10) {
            setState(() {
              notInUseStars.add(star);
              inUseStars.remove(star);
              starsList = notInUseStars;
            });
          }
        }
      },
      builder: (context, accepted, rejected) {
        return Container(
          width: 400,
          color: const Color.fromARGB(255, 235, 231, 231),
          child: Center(
            child: buildStarList(starsList),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const CText(
                text: "In use: ",
                weight: FontWeight.bold,
              ),
              buildDragTargetList(true,inUseStars),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const CText(
                text: "Not in use: ",
                weight: FontWeight.bold,
              ),
              buildDragTargetList(false,notInUseStars),
            ],
          ),
        ],
      ),
    );
  }
}
