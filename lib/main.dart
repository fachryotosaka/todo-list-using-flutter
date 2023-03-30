import 'package:flutter/material.dart';
import 'package:todo_list/data/shared/Task_saved.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/data/thems.dart';
import 'package:todo_list/screens/splash.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await TaskerPreference.init(); // for initial SharedPerfomance ..
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemProvider(),
      builder: (context, _) {
        final themProvider = Provider.of<ThemProvider>(context);
        return MaterialApp(
          title: 'Flutter ToDdo',
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        );
      });
}
