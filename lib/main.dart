import 'package:cozy_app/pages/pages.dart';
import 'package:cozy_app/providers/space_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpaceProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
    // return MaterialApp(
    //   home: SplashPage(),
    //   debugShowCheckedModeBanner: false,
    // )
  }
}
