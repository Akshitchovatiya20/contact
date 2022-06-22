import 'package:contact/Details.dart';
import 'package:contact/Home.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => home(),
        'dt': (context) => detail(),
      },
    ),
  );
}