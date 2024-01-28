import 'package:flutter/material.dart';

class StarRatingWidget extends StatefulWidget {
  const StarRatingWidget({super.key});

  @override
  StarRatingWidgetState createState() => StarRatingWidgetState();
}

class StarRatingWidgetState extends State<StarRatingWidget> {
  int _selectedStars = 1;


  @override
  Widget build(BuildContext context) {
    return Row();
  }

  void _updateStars(int stars) {
    setState(() {
      _selectedStars = stars;

    });
  }
}

class StarOptionButton extends StatelessWidget {
  final String label;
  final int stars;
  final int selectedStars;
  final Function(int) onPressed;

  const StarOptionButton(this.label, this.stars, this.selectedStars, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(stars),
      style: TextButton.styleFrom(
        foregroundColor: stars == selectedStars ? Colors.black : Colors.indigo,
      ),
      child: Text(label),
    );
  }
}
