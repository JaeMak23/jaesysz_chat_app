import 'package:flutter/material.dart';
import 'package:jaesysz_chat_app/screens/screens.dart';
import 'package:jaesysz_chat_app/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Jaesysz Chat App',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.light,
      home: HomeScreen() ,
    );
  }
}
