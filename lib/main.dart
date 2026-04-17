import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_robo/core/networking/api_service.dart';
import 'package:mini_robo/features/camera_screens/data/repos/camera_repo.dart';
import 'package:mini_robo/features/camera_screens/logic/cubit/camera_cubit.dart';
import 'package:mini_robo/features/home/logic/cubit/movement_cubit.dart';
import 'package:mini_robo/shared/buttons/custom_navigation_bottom.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MovementCubit(ApiService())),
        BlocProvider(
          create: (context) =>
              CameraCubit(CameraRepo(ApiService()), ApiService()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Robot',
      theme: ThemeData(
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: BottomNavigationCustom(),
    );
  }
}
