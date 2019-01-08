import 'package:flutter/material.dart';

class FavouriteWidget extends StatefulWidget {
  @override
  _FavouriteWidgetState createState() {
    return _FavouriteWidgetState();
  }
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  bool _isFavourite = true;
  int _favouriteCount = 41;

  void _toggleFavourite() {
    setState(() {
      if (_isFavourite) {
        _isFavourite = false;
        _favouriteCount -= 1;
      } else {
        _isFavourite = true;
        _favouriteCount += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              icon: (_isFavourite ? Icon(Icons.star) : Icon(Icons.star_border)),
              onPressed: _toggleFavourite),
        ),
        SizedBox(
          width: 18.0,
          child: Container(
            child: Text('$_favouriteCount'),
          ),
        ),
      ],
    );
  }
}
