import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:restaurant_app/pages/pages.dart';
import 'package:restaurant_app/providers/auth_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Splash(),
          '/login': (context) => Login(),
          '/register': (context) => Register(),
          '/home': (context) => Home(),
        },
      ),
    );
  }
}
