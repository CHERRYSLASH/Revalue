import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController usercontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confpasswordcontroller = TextEditingController();
  Future<void> register()async{
    if (emailcontroller.text.endsWith("@muj.manipal.edu")){
      if (passwordcontroller.text == confpasswordcontroller.text){
        try {
          UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailcontroller.text.trim(),
                password: passwordcontroller.text.trim());

              User? user = userCredential.user;

              if (user != null && !user.emailVerified) {
                  await user.sendEmailVerification();
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Verify your email'),
                          content: const Text(
                              'A verification link has been sent to your email. Please verify your email to complete registration.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            )
                          ],
                        );
                      },
                  );
                  Navigator.pushReplacementNamed(context, '/home_page');
              }
          }
          catch (e) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Registration Error'),
                  content: Text(e.toString()), 
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    )
                  ],
                );
              },
            );
          }

      }
      else{
        showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: const Text(
                      'Passwords dont match'
                      ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    )
                  ],
                );
              },
          );
      }
    }
    else{
      showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: const Text(
                      'Incorrect email domain'
                      ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    )
                  ],
                );
              },
          );
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
                    "MUJ OLX",style:TextStyle(
                      fontSize: 20,color:Colors.black,fontWeight: FontWeight.bold,shadows: [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          )])
                          ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Icon(
                    Icons.person,
                    size: 90,
                  ),
              ),
              const SizedBox(height: 10,),
              const Text("Create your account!!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                      controller: usercontroller,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: "Username",
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(10)
                        ),
                        fillColor: Colors.white,
                        filled: true,
                    ),
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                      controller: emailcontroller,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: "Email",
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(10)
                        ),
                        fillColor: Colors.white,
                        filled: true,
                    ),
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                      controller: passwordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(10)
                        ),
                        fillColor: Colors.white,
                        filled: true,
                    ),
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                      controller: confpasswordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(10)
                        ),
                        fillColor: Colors.white,
                        filled: true,
                    ),
                ),
              ),
              const SizedBox(height: 30,),
              GestureDetector(
              onTap: () {
                register();
              },
              child: Container(
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.black,borderRadius:BorderRadius.circular(10)),
                child:const Center(
                  child: Text(
                    "Sign Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                  ),
                )
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
