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
      backgroundColor: Colors.grey[300],

      appBar: AppBar(
        title: const Text(
                    "REVALUE",style:TextStyle(
                      fontSize: 20,color:Colors.black,fontWeight: FontWeight.bold,shadows: [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          )])
                          ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //logo
            const Padding(
              padding:EdgeInsets.only(right: 20),
              child: Icon(
                Icons.login_rounded,
                size: 90,
              ),
            ),
            //message
            const SizedBox(height: 40,),
            const Text("Welcome back you\'ve been missed!",style:TextStyle(fontSize: 15,color:Colors.black) ,),
            const SizedBox(height: 40,),
            
            //username textfield 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:25.0),
              child: TextField(
                controller: emailcontroller,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: "Email",
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(10))),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.white,
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
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(10))),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.white,
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
                  padding: EdgeInsets.only(right: 20),
                  child: Text("forgot password?"),
                ),
              ],
            ),
          
            const SizedBox(height: 30,),
          
            //sign in button
            GestureDetector(
              onTap: () {
                sign_in();
              },
              child: Container(
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.black,borderRadius:BorderRadius.circular(10)),
                child:const Center(
                  child: Text(
                    "Sign In",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
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