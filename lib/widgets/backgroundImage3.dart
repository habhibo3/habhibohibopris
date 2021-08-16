import 'package:flutter/material.dart';

class BackgroundImage3 extends StatelessWidget {
  const BackgroundImage3({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/LODING.jpg'),
          fit: BoxFit.cover,

        ),
      ),
    );

  }
}