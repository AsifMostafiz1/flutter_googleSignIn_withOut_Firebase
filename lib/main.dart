import 'package:flutter/material.dart';
import 'package:google_signinwithout_firebase/provider.dart';
import 'package:google_signinwithout_firebase/screen/apiTest.dart';
import 'package:google_signinwithout_firebase/login_page.dart';
import 'package:google_signinwithout_firebase/test_file.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ProductProvider>(
              create: (_) => ProductProvider())
        ],
        child: const MaterialApp(
          title: 'Flutter Demo',
          home: ApiTest(),
        ));
  }
}
