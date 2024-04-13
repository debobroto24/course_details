import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final int starCount;
  final double rating;
  final Color color;
  final double size;
  final Function(int) onRatingChanged;

  StarRating({
    this.starCount = 5,
    this.rating = 0.0,
    this.color = Colors.yellow,
    this.size = 10,
    required this.onRatingChanged,
  });

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.starCount, (index) {
        return GestureDetector(
          onTap: () {
            if (widget.onRatingChanged != null) {
              widget.onRatingChanged(index + 1);
            }
          },
          child: Icon(
            index < widget.rating.floor()
                ? Icons.star
                : index < widget.rating ? Icons.star_half : Icons.star_border,
            color: widget.color,
            size: widget.size,
          ),
        );
      }),
    );
  }
}