import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_style/Screens/store_home.dart';
import 'package:step_style/Screens/tabs.dart';
import 'package:step_style/Screens/welcome_screen.dart';
import 'package:step_style/data/dummy_data.dart';

void main() {
  runApp(const ProviderScope(
    child: MaterialApp(
        home: WelcomeScreen(),
    ),
  ));
}

