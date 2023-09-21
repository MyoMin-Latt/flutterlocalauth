import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'page/face_page.dart';
import 'page/local_auth_example_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // runApp(const MyApp());
  runApp(const LocalAuthExamplePage());
}

class MyApp extends StatelessWidget {
  static const String title = 'Local Auth';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.red),
        home: const FacePage(),
      );
}
