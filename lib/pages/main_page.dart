

import 'package:flutter/material.dart';
import 'package:network_http/pages/user_page.dart';

import '../models/user_model.dart';
import 'home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
    //       ElevatedButton(
    //           onPressed: (){
    //             Navigator.push(context, MaterialPageRoute(builder: (context) => const LearnHTTP()));
    //           },
    //           child: Text("Garry Potter"),
    // ),
        ],
      ),
    );
  }
}
