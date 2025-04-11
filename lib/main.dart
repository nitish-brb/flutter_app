import 'package:flutter/material.dart';
import 'package:flutter_app/presentations/view/home_page/home_view.dart';
import 'core/constants/app_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FastWay',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: "Gilroy"
      ),
      navigatorKey: AppConstants.globalNavKey,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
    
  }
}
