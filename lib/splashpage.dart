import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weight_calculator/main.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=>MyHomePage(),
          ));
    });
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Center(
       child: Container(color: Colors.transparent,
         child: CircleAvatar(backgroundImage:
         AssetImage('assets/register.png'),
           radius: 200,child:
           Text('Welcome',style: TextStyle(fontSize: 30,
               color: Colors.indigo.shade800),),),

       ),
     ),
   );
  }
}
