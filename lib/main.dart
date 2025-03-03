import 'package:flutter/material.dart';
import 'package:music_app/config/routes.dart';
import 'package:music_app/core/utils/themes/app_theme.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MusicApp());
}

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        theme: Themes.appTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: Routes.router,
      );
    });
  }
}
