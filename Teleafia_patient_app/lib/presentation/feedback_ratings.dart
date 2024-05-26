import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../shared/bottom_nav.dart';
import '../shared/header.dart';


class RatingStars extends StatefulWidget {
  final void Function(int rating) onRatingChanged;

  RatingStars({required this.onRatingChanged});

  @override
  _RatingStarsState createState() => _RatingStarsState();
}

class _RatingStarsState extends State<RatingStars> {
  int _currentRating = 0;
  Color maroon = const Color(0xFFc00100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(0.0),
        child: Column(
          children: [
            HealthClientHeader(heading: 'Ratings'),

      Container(
        padding: EdgeInsets.all(50.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text('Rate our services',
        style: TextStyle(
          color: maroon,
          fontSize: 20.0,
        ),),
          SizedBox(height: 20.0),

          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(
                _currentRating >= 1 ? Icons.star : Icons.star_border,
                color: maroon,
              ),
              onPressed: () {
                setState(() {
                  _currentRating = 1;
                  widget.onRatingChanged(_currentRating);
                });
              },
            ),
            IconButton(
              icon: Icon(
                _currentRating >= 2 ? Icons.star : Icons.star_border,
                color: maroon,
              ),
              onPressed: () {
                setState(() {
                  _currentRating = 2;
                  widget.onRatingChanged(_currentRating);
                });
              },
            ),
            IconButton(
              icon: Icon(
                _currentRating >= 3 ? Icons.star : Icons.star_border,
                color: maroon,
              ),
              onPressed: () {
                setState(() {
                  _currentRating = 3;
                  widget.onRatingChanged(_currentRating);
                });
              },
            ),
            IconButton(
              icon: Icon(
                _currentRating >= 4 ? Icons.star : Icons.star_border,
                color: maroon,
              ),
              onPressed: () {
                setState(() {
                  _currentRating = 4;
                  widget.onRatingChanged(_currentRating);
                });
              },
            ),
            IconButton(
              icon: Icon(
                _currentRating >= 5 ? Icons.star : Icons.star_border,
                color: maroon,
              ),
              onPressed: () {
                setState(() {
                  _currentRating = 5;
                  widget.onRatingChanged(_currentRating);
                });
              },
            ),
          ],
        ),
          SizedBox(height: 20.0),

          Text('Send us your feedback and ratings',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),),

          SizedBox(height: 20.0),

          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsetsDirectional.all(15.0),
              hintText: 'Type feedback here',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color: Color(0xFF982B15)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: maroon),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.send, color: const Color(0xFFc00100)),
                onPressed: () {
                  print('Send button pressed');
                },
              ),

            ),
          ),
          SizedBox(height: 20.0),

        ]
        ),
      ),
          ],
        )
      ),
        bottomNavigationBar: HealthClientFooter(),
        );
  }
}
