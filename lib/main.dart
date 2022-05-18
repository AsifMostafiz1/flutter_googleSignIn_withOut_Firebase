import 'package:flutter/material.dart';
import 'package:google_signinwithout_firebase/screen/apiTest.dart';
import 'package:google_signinwithout_firebase/login_page.dart';

void main(){

  runApp( const MyApp());
}

class MyApp extends StatefulWidget  {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  // This widget is the root of your application.
  Widget build(BuildContext context){
    return  const MaterialApp(
      title: 'Flutter Demo',

      home: ApiTest(),
    );
  }
}


