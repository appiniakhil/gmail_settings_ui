import 'package:flutter/material.dart';
import 'package:gmail_settings_ui/custom_text.dart';
import 'package:gmail_settings_ui/star_rating_widget.dart';

class Star {
  final Color color;

  Star(this.color);
}

class CText extends StatelessWidget {
  final String text;
  final FontWeight weight;

  const CText({Key? key, required this.text, this.weight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: weight),
    );
  }
}

class DragAndDropScreen extends StatefulWidget {
  const DragAndDropScreen({Key? key}) : super(key: key);

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
  ];

  Widget buildStar(Star star) {
    return Draggable<Star>(
      data: star,
      feedback: Icon(Icons.star, color: star.color.withOpacity(0.7)),
      childWhenDragging: Icon(Icons.star, color: Colors.transparent),
      child: Icon(Icons.star, color: star.color),
    );
  }

  Widget buildStarList(List<Star> stars) {
    return Row(
      children: stars.map((star) => buildStar(star)).toList(),
    );
  }

  Widget buildDragTargetList(bool isInUse, List<Star> starsList) {
    return DragTarget<Star>(
      onAccept: (star) {
        setState(() {
          if (isInUse) {
            if (inUseStars.length < 10 && !inUseStars.contains(star)) {
              inUseStars.add(star);
              notInUseStars.remove(star);
            }
          } else {
            if (notInUseStars.length < 10 && !notInUseStars.contains(star)) {
              notInUseStars.add(star);
              inUseStars.remove(star);
            }
          }
        });
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

  void _updateStars(int stars) {
    setState(() {
      inUseStars.clear(); // Clear the current list of in-use stars
      notInUseStars.clear(); // Clear the current list of not-in-use stars

      if (stars == 1) {
        // Add one star to in-use stars
        inUseStars.add(Star(Colors.yellow[600]!));
      } else if (stars == 4) {
        // Add four stars to in-use stars
        inUseStars.addAll([
          Star(Colors.yellow[600]!),
          Star(Colors.orange[600]!),
          Star(Colors.red[600]!),
          Star(Colors.purple[600]!),
        ]);
      } else if (stars == 10) {
        // Add all stars to in-use stars
        inUseStars.addAll([
          Star(Colors.yellow[600]!),
          Star(Colors.orange[600]!),
          Star(Colors.red[600]!),
          Star(Colors.purple[600]!),
          Star(Colors.blue[600]!),
          Star(Colors.green[600]!),
        ]);

        // Add all stars to not-in-use stars
        notInUseStars.addAll([
          Star(Color.fromRGBO(0, 0, 0, 0))
        ]);
      }

      if (stars != 10) {
        // Update not-in-use stars by adding back stars that are not in use
        notInUseStars.addAll([
          Star(Colors.orange[600]!),
          Star(Colors.red[600]!),
          Star(Colors.purple[600]!),
          Star(Colors.blue[600]!),
          Star(Colors.green[600]!),
        ]);

        // Remove stars from not-in-use stars that are in use
        inUseStars.forEach((inUseStar) {
          notInUseStars.removeWhere((notInUseStar) =>
          notInUseStar.color == inUseStar.color);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CText(
                text: "Presets: ",
                weight: FontWeight.bold,
              ),
              ElevatedButton(
                onPressed: () {
                  _updateStars(1);
                },
                child: const Text('1 star'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  _updateStars(4);
                },
                child: const Text('4 stars'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  _updateStars(10);
                },
                child: const Text('All stars'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CText(
                text: "In use: ",
                weight: FontWeight.bold,
              ),
              buildDragTargetList(true, inUseStars),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CText(
                text: "Not in use: ",
                weight: FontWeight.bold,
              ),
              buildDragTargetList(false, notInUseStars),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Drag and Drop'),
      ),
      body: DragAndDropScreen(),
    ),
  ));
}
