import 'package:flutter/material.dart';

class Recommendations extends StatefulWidget {
  const Recommendations({super.key});

  @override
  State<Recommendations> createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Container(   
              width: double.infinity,
              color: Color(0xFFCCD0CF),
              child: const Icon(Icons.abc_outlined),
        ),
      ),
    );
  }
}