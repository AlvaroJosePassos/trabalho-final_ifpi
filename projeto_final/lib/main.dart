import 'package:flutter/material.dart';
import 'package:projeto_final/view/CreateAccountView.dart';
import 'package:projeto_final/view/HomeView.dart';
import 'package:projeto_final/view/ListContactView.dart';
import 'package:projeto_final/view/LoginView.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:projeto_final/view/MapPageView.dart';

void main() {
  databaseFactoryOrNull = null;
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Final',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginView(),
        '/HomeView': (context) => HomeView(),
        '/CreateAccountView': (context) => CreateAccountView(),
        '/ListContactView': (context) => ListContactView(),
        '/MapPageView': (context) => MapPage(
              title: 'Mapa',
            ),
      },
    );
  }
}
