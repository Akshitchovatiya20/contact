import 'dart:async';

import 'package:contact/screen/home/view/Details.dart';
import 'package:contact/screen/home/view/Home.dart';
import 'package:contact/screen/home/view/Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

bool themeData = true;
StreamController<bool>data = StreamController();
void main()
{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.green,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.grey,
  ),);

  ThemeData _dark =ThemeData(
    primarySwatch: Colors.amber,
    brightness: Brightness.dark,
  );

  ThemeData _light =ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
  );

  runApp(
    StreamBuilder(
      stream: data.stream,
      initialData: true,
      builder: (context , snapshot){
        return  MaterialApp(
          theme: themeData == true ? _light : _dark,
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => home(),
            'det': (context) => detail(),
          },
        );
      },
    ),
  );
}