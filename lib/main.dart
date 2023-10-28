import 'package:arch_x_spacex/services_manager.dart';
import 'package:arch_x_spacex/view_modules/timeline/timeline_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ServicesManager _servicesManager;
  @override
  void initState() {
    _servicesManager = const ServicesManager();
    _servicesManager.registerGlobalServices();
    super.initState();
  }

  @override
  void dispose() {
    _servicesManager.unregisterGlobalServices();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpaceX - The Launches',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme:
            const AppBarTheme(backgroundColor: Color.fromARGB(255, 18, 18, 18)),
        cardTheme: CardTheme(
            color: const Color.fromARGB(255, 47, 47, 47),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
      ),
      home: const TimelineView(),
    );
  }
}
