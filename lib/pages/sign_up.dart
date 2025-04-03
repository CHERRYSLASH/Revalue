import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Sign_UP extends StatefulWidget {
  const Sign_UP({super.key,});

  @override
  State<Sign_UP> createState() => _Sign_UPState();
}



class _Sign_UPState extends State<Sign_UP> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  
  Future<void> sign_in() async{
    showDialog(context: context, builder: (context){
      return const Center(
        child: CircularProgressIndicator()
        );
      }
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text);
      Navigator.pushReplacementNamed(context, '/home_page');
    }
    
    catch (e) {
      print("Login failed");
      Navigator.pop(context);

    }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191A1F),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //logo
            const Padding(
              padding:EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.face_rounded,
                size: 120,
                color: const Color(0xFF35383F),
              ),
            ),
            //message
            const SizedBox(height: 20,),
            Text("Welcome Back", style: TextStyle(fontSize: 20, color: const Color(0xFFCCD0CF), fontWeight: FontWeight.bold)),
            const SizedBox(height: 60,),
            
            //username textfield 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:25.0),
              child: TextField(
              controller: emailcontroller,
              obscureText: false,
              style: const TextStyle(color: Colors.white), // Added text style
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(color:  Color(0xFF858585)),
                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: const Color(0xFF35383F)),borderRadius: BorderRadius.all(Radius.circular(10))),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:const Color(0xFF35383F)),borderRadius: BorderRadius.circular(10)),
                fillColor:const Color(0xFF35383F),
                filled: true,
              ),
              ),
            ),
          
            const SizedBox(height:20,),
            
            //password textfield
             Padding(
              padding: const EdgeInsets.symmetric(horizontal:25.0),
              child: TextField(
                controller: passwordcontroller,
                style: const TextStyle(color: Colors.white),
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color:  Color(0xFF858585)),
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: const Color(0xFF35383F)),borderRadius: BorderRadius.all(Radius.circular(10))),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:const Color(0xFF35383F)),borderRadius: BorderRadius.circular(10)),
                  fillColor:const Color(0xFF35383F),
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height:15,),
            //forgot password
            const Row(
              mainAxisAlignment:MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Text(
                  "forgot password?",
                  style: TextStyle(
                    color: Color(0xFFCCD0CF),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                ),
              ],
            ),
          
            const SizedBox(height: 60,),
          
            //sign in button
            GestureDetector(
              onTap: () {
                sign_in();
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                decoration: BoxDecoration(color: Color(0xFF607B82),borderRadius:BorderRadius.circular(10)),
                child:const Center(
                  child: Text(
                    "Sign In",style: TextStyle(color: const Color(0xFFCCD0CF),fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                )
              ),
            ),
          
          
            //microsoft login
          
          
          
            
            //not a member sign up
            ],
            
          ),
        ),
      ),
    );
  }
}