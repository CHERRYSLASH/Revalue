import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.grey[300]!, Colors.grey[600]!],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: 'REVALUE'.split('').map((letter) => 
                    Text(letter, 
                      style: const TextStyle(
                        fontSize: 50, fontWeight: FontWeight.bold,shadows: [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ],
                        )
                      )
                  ).toList(),
                ),
              ),
              Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:EdgeInsets.only(bottom:100),
                child: Column(
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/registration');
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 3), 
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12), 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('SIGN UP',style: TextStyle(fontSize:15 , fontWeight: FontWeight.bold,color: Color.fromARGB(255, 0, 0, 0))),
                    ),
                    const SizedBox(height:20),
                    GestureDetector(
                      child: const Text('Already registered ? Login In',style: TextStyle(fontSize:10 , fontWeight: FontWeight.bold,color: Color.fromARGB(255, 0, 0, 0))),
                      onTap: () {
                        Navigator.pushNamed(context, '/sign_up');
                      }
                      )
                   ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}