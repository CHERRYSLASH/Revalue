import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF191A1F),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Spacer pushes content downward
            const Spacer(),

            // "REVALUE" text centered
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: 'REVALUE'.split('').map((letter) => 
                  Text(
                    letter, 
                    style: const TextStyle(
                      color: const Color(0xFFCCD0CF),
                      fontSize: 50, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ).toList(),
              ),
            ),

            // Spacer pushes the button down dynamically
            const Spacer(flex: 1),

            // Buttons at the bottom
            Padding(
              padding: const EdgeInsets.only(bottom: 30), // Adjusts spacing
              child: Column(
                children: [
                  GestureDetector(
                    child: const Text(
                      'Already registered? Log In',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFCCD0CF)),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/sign_up');
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registration');
                    },
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF607B82), // Button color
                    foregroundColor: const Color(0xFFCCD0CF), // Text color
                    padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15), // Extra padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded edges
                    ),
                    ),
                    child: const Text(
                      'GET STARTED',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFCCD0CF)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
