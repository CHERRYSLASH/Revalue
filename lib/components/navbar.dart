import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';

class Nav_Bar extends StatefulWidget {
  const Nav_Bar({super.key});

  @override
  State<Nav_Bar> createState() => _Nav_BarState();
}

class _Nav_BarState extends State<Nav_Bar> {
  @override
  Widget build(BuildContext context) {
    return const GNav(
      
      
      backgroundColor: Color(0x111F2C),
      
      tabs: [
        GButton(icon:Icons.home,),
        GButton(icon:Icons.chat,),
        GButton(icon:Icons.add,),
        GButton(icon:Icons.person,),
        ]
      );
  }
}