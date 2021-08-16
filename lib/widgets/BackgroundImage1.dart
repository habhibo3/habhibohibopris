import 'package:flutter/material.dart';

class BackgroundImage1 extends StatelessWidget {
  const BackgroundImage1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/black.jpg'),
          fit: BoxFit.cover,

        ),
      ),
    );

  }
}