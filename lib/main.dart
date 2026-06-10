import 'package:flutter/material.dart';
import 'package:flutter_notes_app/config/theme/app_theme.dart';
import 'package:flutter_notes_app/home/presentation/pages/home_page.dart';
import 'package:flutter_notes_app/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}
