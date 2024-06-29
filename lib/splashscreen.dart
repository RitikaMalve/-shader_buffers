// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:sky/main.dart';

// class Splashscreen extends StatefulWidget {
//   const Splashscreen({super.key});

//   @override
//   State<Splashscreen> createState() => _SplashscreenState();
// }

// class _SplashscreenState extends State<Splashscreen> {
//   @override
//   void initState() {
    
//     super.initState();
//     Timer(Duration(seconds: 2),(){
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));

//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.cyan,
//       body: Center(
//         child: Container(
//                child: Text("NK",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
//         ),
//       ),
//     );
//   }
// }