import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasksmgmt/screens/home.dart';

void  main() /*async*/{
 //await Hive.initFlutter();
  runApp(const MyAppp());
}
class MyAppp extends StatelessWidget {
  const MyAppp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      //theme: ThemeData(primarySwatch: Colors.yellow[200]),
    );
  }
}


