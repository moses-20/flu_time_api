import 'package:flutter/material.dart';
import 'package:flu_time_api/pages/home.dart';
import 'package:flu_time_api/pages/loading.dart';
import 'package:flu_time_api/pages/location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => Location(),
    },
  ));
}
