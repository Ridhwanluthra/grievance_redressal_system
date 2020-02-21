import 'package:flutter/material.dart';

Widget appBarTitle(BuildContext context) {
  return RichText(
    text: TextSpan(
      text: "Rajiv Babbar, ",
      style: TextStyle(fontSize: 30),
      children: <TextSpan>[
        TextSpan(
            text: 'BJP',
            style: TextStyle(color: Theme.of(context).accentColor)),
      ],
    ),
  );
}
