import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override

  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 80, right: 80, top: 120, bottom: 30),
              child: Image.asset("assets/avocado.png", height: 200,),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                "We deliver groceries at your doorstep",
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSerif(fontSize: 36, fontWeight: FontWeight.bold)),
              ),
            const Text("Fresh items everyday", style: TextStyle(color: Colors.grey),),
            const Spacer(),
            GestureDetector(
              onTap: ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return const HomePage();
              },)),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12)
                ),
                padding: const EdgeInsets.all(24),
                child: const Text("Get Started", style: TextStyle(color: Colors.white),),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
