

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_app/core/utils/enums/route_enums.dart';
import 'package:music_app/presentations/screens/main_screen.dart';
import 'package:music_app/presentations/screens/play_music_screen.dart';

final GoRouter router=GoRouter(
  routes: [
    GoRoute(
      path: RouteEnums.mainScreen.path,
      builder: (context,state)=>MainScreen(),
      name:RouteEnums.mainScreen.name),
    GoRoute(
      path: RouteEnums.playMusicScreen.path,
      builder: (context, state) =>PlayMusicScreen(),
      name: RouteEnums.playMusicScreen.name)
  ],

);