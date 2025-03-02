import 'package:flutter/material.dart';
import 'package:music_app/config/routes.dart';
import 'package:music_app/core/utils/themes/app_theme.dart';

void main()
{
runApp(MusicApp());

}
class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: Themes.appTheme,
      debugShowCheckedModeBanner: false,
      routerConfig:Routes.router,
    );
  }
}