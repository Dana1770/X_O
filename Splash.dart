import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:x_o_game/MyApp/my_app.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}
class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    startSplachTimer(context, MyApp());
  }
  @override
  Widget build(BuildContext context) {
return    Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 226, 235),

  body:  Padding(
    padding:const  EdgeInsets.only(top: 100.0),
    child: Column(
      children: [
const SizedBox(height: 50,),
           Center(child: Lottie.asset('assets/Animation - 1712956974301.json')),
          const Text('TIC TAC TOE',style: TextStyle(fontFamily: 'CRYSPER',fontSize: 24,fontWeight: FontWeight.bold),)

      ],
    ),
  ),

);
  }
}
startSplachTimer(context, w) {
  Timer(const Duration(seconds: 5),
      () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => w)));
}
