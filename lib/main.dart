 
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_robo/constants/splash.dart';
import 'package:mini_robo/root.dart';
 

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await SystemChrome.setPreferredOrientations([
DeviceOrientation.portraitUp
 ]);
 
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white
      ),
      home:GlassBottomNavBar(),
    );
  }
}


