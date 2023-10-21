import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:scribble_clone/home_screen.dart';
import 'package:scribble_clone/utils/colors.dart';

void main() {
  // await Future.delayed(Duration(seconds: 1),() {
  //   FlutterNativeSplash.remove();
  // },);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scribble',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "QuickSand",
        primaryColor: primaryColor,
        primarySwatch: createMaterialColor(primaryColor),
        appBarTheme:const AppBarTheme(elevation: 0,)
      ),
      home: const HomeScreen(),
    );
  }
}

//Function to create a MaterialColor from a single color
MaterialColor createMaterialColor(Color color) {
  List<Color> shades = [
    color,
    Color.lerp(color, Colors.black, 0.1)!,
    Color.lerp(color, Colors.black, 0.2)!,
    Color.lerp(color, Colors.black, 0.3)!,
    Color.lerp(color, Colors.black, 0.4)!,
    Color.lerp(color, Colors.black, 0.5)!,
    Color.lerp(color, Colors.black, 0.6)!,
    Color.lerp(color, Colors.black, 0.7)!,
    Color.lerp(color, Colors.black, 0.8)!,
    Color.lerp(color, Colors.black, 0.9)!,
  ];

  return MaterialColor(color.value, {
    50: shades[0],
    100: shades[1],
    200: shades[2],
    300: shades[3],
    400: shades[4],
    500: shades[5],
    600: shades[6],
    700: shades[7],
    800: shades[8],
    900: shades[9],
  });
}