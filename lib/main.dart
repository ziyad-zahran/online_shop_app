import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store/screens/home_page.dart';
import 'package:store/screens/upgrade_product_page.dart';


void main() {
  runApp(  const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        HomePage.id : (context) => HomePage(),
        UpgradePage.id : (context) => UpgradePage(),
      },
      initialRoute: HomePage.id,
    );
  }
}

